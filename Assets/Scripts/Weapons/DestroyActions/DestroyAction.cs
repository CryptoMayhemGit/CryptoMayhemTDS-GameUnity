using UnityEngine;

namespace Assets.Scripts.Weapons.DestroyActions
{
    [System.Serializable]
    public abstract class DestroyAction
    {
        public abstract void OnDestroy(Containers.CharacterContainer owner, Vector3 position, Quaternion rotation);
    }
}