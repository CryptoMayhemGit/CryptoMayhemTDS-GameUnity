using System;

namespace Assets.Scripts.Weapons.AttackTypes
{
    public abstract class AttackType
    {
        protected Action Shoot;

        public void Init(Action Shoot) => this.Shoot = Shoot;
        public virtual void OnStart() { }
        public abstract bool OnUpdate();
    }
}