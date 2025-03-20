using UnityEngine;

namespace Assets.Scripts
{
    public abstract class CharacterComponent : MonoBehaviour
    {
        protected bool isActive { get; private set; } = false;

        public virtual void OnSpawn()
        {
            isActive = true;
        }

        public virtual void OnDespawn()
        {
            isActive = false;
        }
    }
}