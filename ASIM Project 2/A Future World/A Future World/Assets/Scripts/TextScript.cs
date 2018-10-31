using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class TextScript : MonoBehaviour
{
    TextMeshPro textMeshPro;

    // Use this for initialization
    void Start()
    {
        textMeshPro = GetComponent<TextMeshPro>();
    }

    // Update is called once per frame
    void Update()
    {
        //Vector3 v = Camera.main.transform.position - transform.position;
        //v.x = v.z = 0.0f;
        transform.LookAt(Camera.main.transform.position);
        transform.Rotate(0, 180, 0);

        float dist = Vector3.Distance(transform.position, Camera.main.transform.position);
        //Debug.Log(dist);

        if (dist < 10)
        {
            textMeshPro.color = new Color(textMeshPro.color.r, textMeshPro.color.b, textMeshPro.color.g, 8 - dist);
        }
        else
        {
            textMeshPro.color = new Color(textMeshPro.color.r, textMeshPro.color.b, textMeshPro.color.g, 0);
        }

        //transform.position = Camera.main.WorldToScreenPoint(transform.position);
    }
}
