using Assets.Scripts.Containers;
using Assets.Scripts.Cooldowns;
using UnityEngine;

namespace Assets.Scripts.Inventory
{
    public class ConsumableItemInstance : IUsable
    {
        private readonly ConsumableItem reference;
        private int usesLeft;

        public float Cooldown => reference.Cooldown;
        public Sprite Sprite => reference.Sprite;
        public ConsumableItem ItemReference => reference;
        public ConsumableItemInstance(ConsumableItem consumableItem)
        {
            reference = consumableItem;
            usesLeft = consumableItem.MaxUses;
        }

        public bool CanUse(PlayerContainer player) => usesLeft > 0 && (reference.Condition == null || reference.Condition.Check(player));

        public void Use(PlayerContainer player)
        {
            usesLeft -= 1;
            reference.Action.Trigger(player, player.Input.CannonTarget);
            FMODUnity.RuntimeManager.PlayOneShot(reference.UseSound, player.Transform.position);
        }
    }
}