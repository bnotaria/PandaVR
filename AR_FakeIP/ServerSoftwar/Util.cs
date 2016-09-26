using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using UnityEngine;
namespace Panda
{

    public enum MessageType { TextMessage, Init, BlockPlace }
    [Serializable]
    public struct NetMessage
    {
        public MessageType messageType;
        public string message;
    }
    [Serializable]
    public struct MessageInit
    {
        public float Size;
    }
    public struct Vector3m
    {
        public float x;
        public float y;
        public float z;

        public Vector3m(double v1, double v2, double v3): this((float)v1, (float)v2, (float)v3)
        {
            
        }
        public Vector3m(float v1, float v2, float v3)
        {
            x = v1;
            y = v2;
            z = v3;
        }

        public static implicit operator Vector3(Vector3m v)
        {
            return new Vector3(v.x, v.y, v.z);
        }
        public static implicit operator Vector3m(Vector3 v)
        {
            Vector3m u;
            u.x = v.x;
            u.y = v.y;
            u.z = v.z;
            return u;
        }
        public static Vector3m operator +(Vector3m a, Vector3m b)
        {
            return new Vector3m(a.x+b.x,a.y+b.y,a.z+b.z);
        }
        public override string ToString()
        {
            return ((Vector3)this).ToString();
        }
    }
    public class BlockPlaceModel
    {
        public int id;
        public int mat;
        public Vector3m llb;
        public Vector3m urf;
        [Newtonsoft.Json.JsonIgnore]
        public Vector3 size
        {
            get
            {
                return (Vector3)urf-llb;
            }
        }
        [Newtonsoft.Json.JsonIgnore]
        public Vector3 center
        {
            get
            {
                return (Vector3)(llb+urf)/2;
            }
        }
    }
    public static class Util
    {
       
    }
}
