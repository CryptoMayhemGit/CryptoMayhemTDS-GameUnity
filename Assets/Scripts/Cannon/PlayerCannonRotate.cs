using Sirenix.OdinInspector;
using UnityEngine;

namespace Assets.Scripts.Cannon
{
    public class PlayerCannonRotate : CharacterComponent
    {
        [field: SerializeField] public Transform XRotator { get; private set; } = null;
        [SerializeField] private Transform mechBody = null;
        [SerializeField, Range(0.01f, 10f)] private float cannonRotationTime = 1f;
        [SerializeField, MinMaxSlider(-180f, 180f, true)] private Vector2 rotationAngleMinMaxX = new Vector2(-180f, 180f);
        [ShowInInspector, ReadOnly] private float designatedAngleX;

        public void RotateX(Vector3 target, float delta)
        {
            Vector2 diff = new Vector2(target.x - mechBody.position.x, target.z - mechBody.position.z);
            Vector2 forward = new Vector2(mechBody.forward.x, mechBody.forward.z);

            designatedAngleX = ClampAngle(Vector2.SignedAngle(diff, forward), rotationAngleMinMaxX.x, rotationAngleMinMaxX.y);

            XRotator.localRotation = Quaternion.RotateTowards(XRotator.localRotation, Quaternion.Euler(-designatedAngleX, 0f , 0f), cannonRotationTime * 360f * delta);
        }

        private float ClampAngle(float angle, float min, float max)
        {
            if (angle > min && angle < max)
                return angle;
            else if (Mathf.Abs(Mathf.DeltaAngle(angle, min)) < Mathf.Abs(Mathf.DeltaAngle(angle, max)))
                return min;
            else
                return max;
        }
    }
}