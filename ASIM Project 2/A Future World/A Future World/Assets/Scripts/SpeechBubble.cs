using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpeechBubble : MonoBehaviour {

    public string personText;

    public GameObject speechBubble;
    GameObject instBubble;

    Renderer rend;

	// Use this for initialization
	void Start ()
    {
        instBubble = Instantiate(speechBubble, transform.position + new Vector3(0, 2, 0), Quaternion.identity) as GameObject;

        rend = instBubble.GetComponent<Renderer>();
	}
	
	// Update is called once per frame
	void Update ()
    {
        float dist = Vector3.Distance(instBubble.transform.position, Camera.main.transform.position);
        //Debug.Log(dist);

        if (dist < 10)
        {
            rend.material.color = new Color(rend.material.color.r, rend.material.color.b, rend.material.color.g, 8 - dist);
        }
        else
        {
            rend.material.color = new Color(rend.material.color.r, rend.material.color.b, rend.material.color.g, 0);
        }

    }
}
