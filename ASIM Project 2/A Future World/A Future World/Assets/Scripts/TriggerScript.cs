using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.Characters.FirstPerson;

public class TriggerScript : MonoBehaviour {

    public AudioSource hitSound;
    public GameObject player;
    public Camera mainCamera;
    public Camera finaleCamera;

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            player.SetActive(false);

            hitSound.Play();

            mainCamera.enabled = false;
            finaleCamera.enabled = true;
        }
    }
}
