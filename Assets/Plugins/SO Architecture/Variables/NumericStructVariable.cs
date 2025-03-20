public abstract class NumericStructVariable<T> : StructVariable<T>
    where T : struct
{
    public abstract void Add(T t);
    public void Add(NumericStructVariable<T> t) => Add(t);
    public void Add(VariableInstance<T> t) => Add(t);

    public abstract void Subtract(T t);
    public void Subtract(NumericStructVariable<T> t) => Subtract(t);
    public void Subtract(VariableInstance<T> t) => Subtract(t);

    public abstract void Multiply(T t);
    public void Multiply(NumericStructVariable<T> t) => Multiply(t);
    public void Multiply(VariableInstance<T> t) => Multiply(t);

    public abstract void Divide(T t);
    public void Divide(NumericStructVariable<T> t) => Divide(t);
    public void Divide(VariableInstance<T> t) => Divide(t);

    public string ValueToString() => Value.ToString();
}