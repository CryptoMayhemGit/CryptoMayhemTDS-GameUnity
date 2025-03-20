using Assets.Scripts.Weapons.AttackTypes;
using Sirenix.OdinInspector;
using UnityEngine;

namespace Assets.Scripts.Weapons
{
    [CreateAssetMenu(menuName = "ScriptableObjects/Weapons/Artillery")]
    public class ArtilleryWeapon : Weapon
    {
        [FoldoutGroup("Functional"), SerializeField] private Pooling.ArtilleryImpactPool pool = null;
        [FoldoutGroup("Functional"), SerializeReference] private AttackType attackType = new AttackTypeNormal();
        [FoldoutGroup("Functional"), SerializeField] private ArtilleryImpacts.ArtilleryImpactCore artilleryImpactCore = new();

        public override void Init(Containers.PlayerContainer player, Transform parentPivot, bool isRight)
        {
            base.Init(player, parentPivot, isRight);

            attackType.Init(() =>
            {
                SetOnCooldown();
                ammo.SubtractAmmo();

                var artilleryImpact = pool.GetFromPool();
                artilleryImpact.Transform.position = player.Input.CannonTarget;
                artilleryImpact.Init(player, artilleryImpactCore, pool);

                FMODUnity.RuntimeManager.PlayOneShot(shotSound, player.AttackPivot.position);
            });
        }

        public override void StartAttack() => attackType.OnStart();

        public override bool UpdateAttack()
        {
            if (!ammo.CanShoot())
                return false;

            if (IsCooldownReady())
                return attackType.OnUpdate();

            return true;
        }

        public override void StopAttack() { }
    }
}