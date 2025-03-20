using UnityEngine;

namespace Assets.Scripts.Sound
{
    public enum CharacterHitBy
    {
        Default = 0,
        Player = 1,
        Scratcher = 2,
        Cannoneer = 3,
        Cannonball = 21
    }

    public class CharacterSounds : CharacterComponent
    {
        [SerializeField] protected Scripts.Containers.CharacterContainer character = null;

        [SerializeField, Space] protected SerializedDictionary<CharacterHitBy, SoundsHolder> hitSounds = new();
        [SerializeField] protected SoundsHolder shieldBrokenSound = null;
        [SerializeField] protected SoundsHolder deathSound = null;

        [SerializeField, Space] protected SoundsHolder runSound = null;
        [SerializeField, Space] protected SoundsHolder walkSound = null;

        public virtual void PlayHit(CharacterHitBy hitBy)
        {
            if (hitSounds.TryGetValue(hitBy, out SoundsHolder holder))
                holder.Play(character.Transform.position);
            else
                if (hitSounds.TryGetValue(CharacterHitBy.Default, out SoundsHolder holder1))
                    holder1.Play(character.Transform.position);
        }

        public virtual void PlayShieldBroken()
        {
            shieldBrokenSound.Play(character.Transform.position);
        }

        public virtual void PlayDeath()
        {
            deathSound.Play(character.Transform.position);
        }

        public virtual void PlayRun()
        {
            runSound.Play(character.Transform.position);
        }

        public virtual void PlayWalk()
        {
            walkSound.Play(character.Transform.position);
        }
    }
}