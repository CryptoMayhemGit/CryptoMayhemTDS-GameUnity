using System;
using Assets.Scripts.Containers;
using UnityEngine;

namespace Assets.Scripts.Movement.Dash
{
    public class DashCollisionDetector : MonoBehaviour
    {
        [field: SerializeField] public SphereCollider SphereCollider { get; private set; } = null;

        public event Action<CharacterContainer> OnCollision;

        private void OnTriggerEnter(Collider other)
        {
            OnCollision?.Invoke(other.GetComponent<CharacterContainer>());
        }
    }
}