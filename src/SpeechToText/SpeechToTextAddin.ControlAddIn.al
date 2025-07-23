controladdin SpeechToTextAddin
{
    Scripts = '.\src\SpeechToText\speech.js';
    StartupScript = '.\src\SpeechToText\speech.start.js'; // <--- this is the real startup file

    RequestedHeight = 0;
    RequestedWidth = 0;

    Event OnSpeechRecognized(Text: Text);
    Procedure StartRecording();
    Procedure StopRecording();
}
