using Assets.Scripts.StateMachine.State;
using UnityEngine;
using UnityEngine.Profiling;

namespace Assets.Scripts.Fuel
{
    public class PlayerFuel : CharacterComponent
    {
        private enum State { ConsumeFuel, LastChance }

        [SerializeField] private Containers.PlayerContainer player = null;
        [SerializeField] private SOArchitecture.GameManagerVariable gameManager = null;
        [SerializeField] private Stats.CachedDynamicStat biomass = new();
        [SerializeField, Range(0, 90)] private float chanceTime = 10f;
        [SerializeField, Range(0, 25)] private float bioPerSec = 1f;

        private State state;
        private float time;

        public override void OnSpawn()
        {
            base.OnSpawn();

            if (player.Sounds is Sound.PlayerSounds s) s.StartRandomSound();
            
            state = State.ConsumeFuel;

            gameManager.Value.OnUpdate += UpdateState;
        }

        public override void OnDespawn()
        {
            base.OnDespawn();

            if (player.Sounds is Sound.PlayerSounds s) s.StopRandomSound();
            
            switch (state)
            {
                case State.ConsumeFuel:
                    gameManager.Value.OnUpdate -= UpdateState;
                    break;

                case State.LastChance:

                    player.RemoveBlockAttackFactor();

                    if (time < chanceTime)
                        gameManager.Value.OnUpdate -= UpdateState;
                    else
                        player.RemoveBlockMovementFactor();

                    break;
            }
        }

        private void UpdateState()
        {
            Profiler.BeginSample("PlayerFuel.UpdateState");
            switch (state)
            {
                case State.ConsumeFuel:

                    biomass.Get().ModifyDynamicValue(-bioPerSec * Time.deltaTime);

                    if (biomass.Get().DynamicValue == 0)
                    {
                        player.AddBlockAttackFactor();
                        time = 0f;
                        state = State.LastChance;
                    }

                    break;

                case State.LastChance:

                    if (biomass.Get().DynamicValue > 0)
                    {
                        player.RemoveBlockAttackFactor();
                        state = State.ConsumeFuel;
                    }
                    else if ((time += Time.deltaTime) >= chanceTime)
                    {
                        player.AddBlockMovementFactor();
                        gameManager.Value.OnUpdate -= UpdateState;
                        player.StateMachine.ForceChangeState(new FallPlayerState(player));
                        if (player.Sounds is Sound.PlayerSounds s) s.PlayPowerdown();
                    }

                    break;
            }
            Profiler.EndSample();
        }
    }
}