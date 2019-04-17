import * as functions from 'firebase-functions';
import * as admin from "firebase-admin";

admin.initializeApp(functions.config().firebase);

exports.addExperience = functions.https.onRequest((req, res) => {
    const exp = req.body;

    if (req.query.password !== "aqedtgujol") {
        return res.json({
            status: "failed"
        });
    }

    return admin.firestore().collection('experiences').add(exp).then(result => {
        return res.json({
            status: "success",
            document: result.id
        });
    });
});

exports.getExperiences = functions.https.onRequest((req, res) => {

    return admin.firestore().collection('experiences').get().then(result => {
        const docs = Array();
        result.forEach(doc => {
            docs.push(Object.assign({}, {id: doc.id}, doc.data()));
        });

        return res.json({
            status: "success",
            experiences: docs
        });
    })
});
