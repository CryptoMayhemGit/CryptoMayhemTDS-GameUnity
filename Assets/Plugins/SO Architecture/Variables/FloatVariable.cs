[UnityEngine.CreateAssetMenu(menuName = SOArchitectureDirectories.VARIABLE_SUBMENU + "Float")]
public class FloatVariable : NumericStructVariable<float>
{
    public override void Add(float t)
    {
        Value += t;
    }

    public override void Divide(float t)
    {
        Value /= t;
    }

    public override void Multiply(float t)
    {
        Value *= t;
    }

    public override void Subtract(float t)
    {
        Value -= t;
    }
}