/*
 * Copyright (c) 2011 LTD Haulmont Samara. All Rights Reserved.
 * Haulmont Samara proprietary and confidential.
 * Use is subject to license terms.

 * Author: Konstantin Krivopustov
 * Created: 07.02.11 13:04
 *
 * $Id$
 */

var thesisLanguage = {

    languageName: "Thesis",

    modules: [
        {
            "name": "Start",
            "label": "msg://Start",
            "category": "common",
            "container": {
                "xtype":"Wf.StartContainer",
                "className": "WireIt-Container WireIt-ImageContainer Bubble",
                "icon": "../common/res/icons/start_icon.png",
                "image": "../common/res/icons/start.png",
                "selectedImage": "../common/res/icons/start-selected.png",
                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://Start",
                        "readonly":"true"
                    },
                    {
                        "type": "boolean",
                        "label": "msg://Start.mark",
                        "name": "mark",
                        "value": true
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    defaultForm: "transition",
                                    defaultFormFields: {
                                        commentVisible: true,
                                        cardRolesVisible: true
                                    },
                                    type: "wfFormSelect",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: false
                                }
                            }
                        ]
                    }
                ],
                "terminals": [
                    {
                        "direction": [0,1], "offsetPosition": {"left": 8, "top": 30 }, "name": "out",
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "Endorsement",
            "label": "msg://Endorsement",
            "description": "msg://Endorsement",
            "category": "documents",
            "container": {
                "xtype": "Wf.TsSignatureContainer",
                "icon": "../thesis/res/icons/endorsement_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://Endorsement"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "role",
                        "label": "msg://role",
                        "required": false,
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://Endorsement",
                        "readonly":"true"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://description",
                        "name": "description",
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://ParallelAssignment.successTransition",
                        "name": "successTransition",
                        "value": ""
                    },
                    {
                        "type": "boolean",
                        "label": "msg://ParallelAssignment.refusedOnly",
                        "name": "refusedOnly",
                        "value": false
                    },
                    {
                        "type": "boolean",
                        "label": "msg://ParallelAssignment.finishBySingleUser",
                        "name": "finishBySingleUser",
                        "value": false
                    },
                    {
                        "type": "boolean",
                        "label": "msg://digitalSignature",
                        "name": "digitalSignature",
                        "id": "digitalSignature",
                        "value": false
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    type: "wfFormSelect",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: true
                                }
                            }
                        ]
                    },
                    {
                        type: "group",
                        legend: "msg://timers",
                        collapsible: "true",
                        collapsed: "true",
                        name: "timers",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {type: "wfTimerSelect", label: "msg://timer", name: "timer"}
                            }
                        ]
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },

        {
            "name": "SequentialEndorsement",
            "label": "msg://SequentialEndorsement",
            "description": "msg://SequentialEndorsement",
            "category": "documents",
            "container": {
                "xtype": "Wf.TsSignatureContainer",
                "icon": "../thesis/res/icons/endorsement_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://SequentialEndorsement"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "role",
                        "label": "msg://role",
                        "required": false,
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://SequentialEndorsement",
                        "readonly":"true"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://description",
                        "name": "description",
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://ParallelAssignment.successTransition",
                        "name": "successTransition",
                        "value": ""
                    },
                    {
                        "type": "boolean",
                        "label": "msg://ParallelAssignment.refusedOnly",
                        "name": "refusedOnly",
                        "value": false
                    },
                    {
                        "type": "boolean",
                        "label": "msg://digitalSignature",
                        "name": "digitalSignature",
                        "id": "digitalSignature",
                        "value": false
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    type: "wfFormSelect",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: true
                                }
                            }
                        ]
                    },
                    {
                        type: "group",
                        legend: "msg://timers",
                        collapsible: "true",
                        collapsed: "true",
                        name: "timers",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {type: "wfTimerSelect", label: "msg://timer", name: "timer"}
                            }
                        ]
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },

        {
            "name": "EdmSending",
            "label": "msg://EdmSending",
            "description": "msg://EdmSending",
            "category": "documents",
            "container": {
                "xtype": "Wf.TsSignatureContainer",
                "icon": "../thesis/res/icons/approval_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://EdmSending"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "role",
                        "label": "msg://role",
                        "required": true,
                        "value": ""
                    }
                ],

                 "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://EdmSending",
                        "readonly":"true"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://description",
                        "name": "description",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://sentTransition",
                        "name": "sentTransition",
                        "required": true,
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://sendingNotRequiredTransition",
                        "name": "sendingNotRequiredTransition",
                        "required": true,
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://signedTransition",
                        "name": "signedTransition",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://refusedTransition",
                        "name": "refusedTransition",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://invalidSignatureTransition",
                        "name": "invalidSignatureTransition",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://edmImprovementTransition",
                        "name": "edmImprovementTransition",
                        "required": false,
                        "value": ""
                    }
                 ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },
        {
            "name": "EdmResponseSigningPreparation",
            "label": "msg://EdmResponseSigningPreparation",
            "description": "msg://EdmResponseSigningPreparation",
            "category": "documents",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/approval_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://EdmResponseSigningPreparation"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "role",
                        "label": "msg://role",
                        "required": true,
                        "value": ""
                    }
                ],

                 "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://EdmResponseSigningPreparation",
                        "readonly":"true"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://description",
                        "name": "description",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "boolean",
                        "name": "isRemoveOtherCurators",
                        "label": "msg://isRemoveOtherCurators",
                        "value": false
                    }
                 ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "SignatureRequired", "direction": [0,1], "offsetPosition": {"left": 70, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1,
                        "label": "msg://EdmResponseSigningPreparation.prepared", "labelPosition" : {"left": 50, "bottom": -25}
                    },
                    {
                        "name": "SignatureNotRequired", "direction": [0,1], "offsetPosition": {"left": 154, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1,
                        "label": "msg://EdmResponseSigningPreparation.signNotRequired", "labelPosition" : {"right": -10, "bottom": -25}
                    }
                ]
            }
        },
        {
            "name": "EdmResponseSigning",
            "label": "msg://EdmResponseSigning",
            "description": "msg://EdmResponseSigning",
            "category": "documents",
            "container": {
                "xtype": "Wf.TsSignatureContainer",
                "icon": "../thesis/res/icons/approval_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://EdmResponseSigning"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "role",
                        "label": "msg://role",
                        "required": true,
                        "value": ""
                    }
                ],

                 "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://EdmResponseSigning",
                        "readonly":"true"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://description",
                        "name": "description",
                        "required": false,
                        "value": ""
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    type: "wfFormSelect",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: true
                                }
                            }
                        ]
                    },
                 ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "Sign", "direction": [0,1], "offsetPosition": {"left": 70, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": false, "nMaxWires": 1,
                        "label": "msg://EdmResponseSigning.sign", "fixed": true
                    },
                    {
                        "name": "Refuse", "direction": [0,1], "offsetPosition": {"left": 70, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": false, "nMaxWires": 1,
                        "label": "msg://EdmResponseSigning.refuse", "fixed": true
                    },
                ]
            }
        },
        {
            "name": "EdmResponseSigningAttachmentsGeneration",
            "label": "msg://EdmResponseSigningAttachmentsGeneration",
            "description": "msg://EdmResponseSigningAttachmentsGeneration",
            "category": "documents",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/approval_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://EdmResponseSigningAttachmentsGeneration"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "role",
                        "label": "msg://role",
                        "required": true,
                        "value": ""
                    },
                    {
                        "type": "boolean",
                        "label": "msg://EdmResponseSigningAttachmentsGeneration.signRefuse",
                        "name": "signRefuse",
                        "value": false
                    }
                ],

                 "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://EdmResponseSigningAttachmentsGeneration",
                        "readonly":"true"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://description",
                        "name": "description",
                        "required": false,
                        "value": ""
                    }
                 ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "Ok", "direction": [0,1], "offsetPosition": {"left": 111, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1,
                        "label": "msg://EdmResponseSigningAttachmentsGeneration.success", "labelPosition" : {"left": 62, "bottom": -25}
                    },
                ]
            }
        },
        {
            "name": "EdmSendingSigningPreparation",
            "label": "msg://EdmSendingSigningPreparation",
            "description": "msg://EdmSendingSigningPreparation",
            "category": "documents",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/approval_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://EdmSendingSigningPreparation"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "role",
                        "label": "msg://role",
                        "required": true,
                        "value": ""
                    }
                ],

                 "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://EdmSendingSigningPreparation",
                        "readonly":"true"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://description",
                        "name": "description",
                        "required": false,
                        "value": ""
                    }
                 ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "Ok", "direction": [0,1], "offsetPosition": {"left": 111, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1,
                        "label": "msg://EdmSendingSigningPreparation.success", "labelPosition" : {"left": 88, "bottom": -25}
                    },
                ]
            }
        },
        {
            "name": "Error",
            "label": "msg://Error",
            "description": "msg://Error",
            "category": "common",
            "container": {
                "xtype":"Wf.ImageContainer",
                "icon": "../thesis/res/icons/error_icon.png",
                "className": "WireIt-Container WireIt-ImageContainer Bubble",
                "image": "../thesis/res/icons/error.png",
                "selectedImage": "../thesis/res/icons/error-selected.png",
                "width": 50,
                "optFields": [
                    {
                        "type": "string",
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://Error"
                    },
                    {
                        "type": "string",
                        "name": "errorMsg",
                        "label": "msg://errorMsg",
                        "required": true,
                        "value": ""
                    }
                ],
                "terminals": [
                    {
                        "direction": [0,-1], "offsetPosition": {"left": 8, "top": -15}, "name": "in",
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },
        {
            "name": "Approval",
            "label": "msg://Approval",
            "description": "msg://Approval",
            "category": "documents",
            "container": {
                "xtype": "Wf.TsSignatureContainer",
                "icon": "../thesis/res/icons/approval_icon.png",
                "width": 250,

                "signCardAvailable": true,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://Approval"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "role",
                        "label": "msg://role",
                        "required": false,
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://Approval",
                        "readonly":"true"
                    },

                    {

                        "type": "string",
                        "trim": true,
                        "label": "msg://description",
                        "name": "description",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "boolean",
                        "label": "msg://digitalSignature",
                        "name": "digitalSignature",
                        "id": "digitalSignature",
                        "value": false
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    type: "wfFormSelect",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: true
                                }
                            }
                        ]
                    },
                    {
                        type: "group",
                        legend: "msg://timers",
                        collapsible: "true",
                        collapsed: "true",
                        name: "timers",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {type: "wfTimerSelect", label: "msg://timer", name: "timer"}
                            }
                        ]
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },
        {
            "name": "DocVersionCreation",
            "label": "msg://DocVersionCreation",
            "description": "msg://DocVersionCreation.descr",
            "category": "documents",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/doc_version_icon.png",
                "width": 250,

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://DocVersionCreation",
                        "readonly":"true"
                    }
                ],

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://DocVersionCreation"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "Registration",
            "label": "msg://Registration",
            "category": "documents",
            "container": {
                "xtype": "Wf.MultiOutContainer",
                "icon": "../thesis/res/icons/approval_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": false,
                        "value": "msg://Registration"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "role",
                        "label": "msg://role",
                        "required": false,
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": false,
                        "value": "msg://Registration",
                        "readonly":"true"
                    },

                    {

                        "type": "string",
                        "trim": true,
                        "label": "msg://description",
                        "name": "description",
                        "required": false,
                        "value": ""
                    },
                    {
                        type: "group",
                        legend: "msg://forms",
                        collapsible: "true",
                        collapsed: "true",
                        name: "forms",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {
                                    firstElementDefaults: {
                                        defaultForm: "registration",
                                    },
                                    type: "tsRegistration",
                                    label: "msg://form",
                                    name: "form",
                                    useTransition: true
                                }
                            }
                        ]
                    },
                    {
                        type: "group",
                        legend: "msg://timers",
                        collapsible: "true",
                        collapsed: "true",
                        name: "timers",
                        fields:[
                            {
                                type: "list",
                                name: "list",
                                elementType: {type: "wfTimerSelect", label: "msg://timer", name: "timer"}
                            }
                        ]
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },
        {
            "name": "ScriptExecution",
            "label": "msg://ScriptExecution",
            "description": "msg://ScriptExecution",
            "category": "common",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../common/res/icons/card_state_icon.png",
                "width": 230,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "required": true,
                        "value": "msg://name"
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "value": ""
                    },

                    {
                        "type": "wfScriptSelect",
                        "name": "script",
                        "label": "msg://script",
                        "required": true,
                        "value": ""
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 100, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 100, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "CustomActivity",
            "label": "msg://CustomActivity",
            "description": "msg://CustomActivity",
            "category": "common",
            "container": {
                "xtype": "Wf.MultiOutContainer",
                "icon": "../thesis/res/icons/wrench_screwdriver.png",
                "width": 230,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "activityClass",
                        "label": "msg://activityClass",
                        "required": true,
                        "value": "com.haulmont.YourClass"
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    }
                ]
            }
        },
        {
            "name": "TaskCreate",
            "label": "msg://TaskCreate",
            "category": "tasks",
            "description": "msg://TaskCreate",
            "container": {
                "xtype": "Wf.MultiOutContainer",
                "icon": "../thesis/res/icons/wrench_screwdriver.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://taskName",
                        "name": "taskName",
                        "required": true,
                        "value": ""
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "roleInitiator",
                        "label": "msg://roleInitiator",
                        "required": true,
                        "value": ""
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "roleExecutor",
                        "label": "msg://roleExecutor",
                        "required": true,
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "roleController",
                        "label": "msg://roleController",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "roleObserver",
                        "label": "msg://roleObserver",
                        "required": false,
                        "value": ""
                    },
                    {
                        "type": "boolean",
                        "name": "waitCompletion",
                        "label": "msg://waitCompletion",
                        "required": false,
                        "value": true
                    },
                    {
                        "type": "boolean",
                        "name": "oneOfTheExecutors",
                        "label": "msg://oneOfTheExecutors",
                        "required": false,
                        "value": false
                    },
                    {
                        "type": "tsScriptSelect",
                        "label": "msg://script",
                        "name": "script",
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://transitionAtTheEndTask",
                        "name": "transitionAtTheEndTask",
                        "value": ""
                    },
                    {
                        "type": "wfOutputSelect",
                        "label": "msg://transitionAtTheCancelTask",
                        "name": "transitionAtTheCancelTask",
                        "value": ""
                    }
                ],
                "terminals": [
                    {
                        "name": "in", "direction": [0, -1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in", "allowedTypes": ["out"]}
                    }
                ]
            }
        },
        {
             "name": "SubDesign",
             "label": "msg://SubDesign",
             "description": "msg://SubDesign",
             "category": "common",
             "container": {
                 "xtype": "Wf.DesignContainer",
                 "icon": "../common/res/icons/assignment_icon.png",
                 "width": 250,

                 "optFields": [
                     {
                          "type": "string",
                          "trim": true,
                          "label": "msg://name",
                          "name": "name",
                          "required": false,
                          "value": "msg://SubDesign",
                          "readonly": "true"
                     },
                     {
                          "type": "wfDesignSelect",
                          "name": "design",
                          "label": "msg://SubDesign",
                          "required": false,
                          "disabled": true
                     }
                 ],
                 "fields": [
                     {
                          "type": "string",
                          "trim": true,
                          "name": "name",
                          "label": "msg://name",
                          "required": false
                     },
                     {
                          "type": "wfDesignSelect",
                          "name": "design",
                          "label": "msg://SubDesign",
                          "required": false
                    },
                 ],

                 "terminals": [
                     {
                          "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                          "ddConfig": {"type": "in","allowedTypes": ["out"]}
                     },
                     {
                          "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                          "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true,
                          "nMaxWires" : 1
                     }
                 ]
             }
        }
    ],

    extendContainers: [
        {superContainer: "Wf.CardPropertyContainer", extendContainer: "Wf.TsCardPropertyContainer"}
    ],

    registerForms: function() {
        Wf.registerForms();

        Wf.FormSelect.registerForm("resolution", {
            label: i18n.get("resolution"),
            fields: [
                {type: "boolean", name: "attachmentsVisible", label: i18n.get("attachmentsVisible")},
                {type: "boolean", name: "commentRequired", label: i18n.get("commentRequired")},
                {type: "boolean", name: "digitalSignature", label: i18n.get("formDigitalSignature")},
                {type: "boolean", name: "signCard", label: i18n.get("signCard")},
                {type: "boolean", name: "signatureRequired", label: i18n.get("signatureRequired")},
            ]
        });

        Wf.FormSelect.registerForm("transition", {
            label: i18n.get("transition"),
            fields: [
                {type: "boolean", name: "commentVisible", label: i18n.get("commentVisible")},
                {type: "boolean", name: "commentRequired", label: i18n.get("commentRequired")},
                {type: "boolean", name: "cardRolesVisible", label: i18n.get("cardRolesVisible")},
                {type: "boolean", name: "dueDateVisible", label: i18n.get("dueDateVisible")},
                {type: "boolean", name: "onlineEditingVisible", label: i18n.get("onlineEditingVisible")},
                {type: "boolean", name: "refusedOnlyVisible", label: i18n.get("refusedOnlyVisible")},
                {type: "string", name: "requiredRoles", label: i18n.get("requiredRoles")},
                {type: "string", name: "visibleRoles", label: i18n.get("visibleRoles")},
                {type: "boolean", name: "hideAttachments", label: i18n.get("hideAttachments")},
                {type: "string", name: "requiredAttachmentTypes", label: i18n.get("requiredAttachmentTypes")},
                {type: "string", name: "formHeight", label: i18n.get("formHeight")},
            ]
        });

        Wf.FormSelect.registerForm("edmSendingTransition", {
            label: i18n.get("edmSendingTransition"),
            fields: [
                {type: "boolean", name: "commentVisible", label: i18n.get("commentVisible")},
                {type: "boolean", name: "commentRequired", label: i18n.get("commentRequired")},
                {type: "boolean", name: "cardRolesVisible", label: i18n.get("cardRolesVisible")},
                {type: "boolean", name: "dueDateVisible", label: i18n.get("dueDateVisible")},
                {type: "boolean", name: "refusedOnlyVisible", label: i18n.get("refusedOnlyVisible")},
                {type: "string", name: "signerRole", label: i18n.get("signerRole"), required: true},
                {type: "string", name: "requiredRoles", label: i18n.get("requiredRoles")},
                {type: "string", name: "visibleRoles", label: i18n.get("visibleRoles")},
                {type: "boolean", name: "hideAttachments", label: i18n.get("hideAttachments")},
                {type: "string", name: "requiredAttachmentTypes", label: i18n.get("requiredAttachmentTypes")},
                {type: "string", name: "formHeight", label: i18n.get("formHeight")},
                {type: "boolean", name: "signingPreparation", label: i18n.get("signingPreparation"), value: true},
            ]
        });

        Wf.FormSelect.registerForm("edmInboundProcessingTransition", {
            label: i18n.get("edmInboundProcessingTransition"),
            fields: [
                {type: "boolean", name: "commentVisible", label: i18n.get("commentVisible"), value: true},
                {type: "boolean", name: "commentRequired", label: i18n.get("commentRequired")},
                {type: "boolean", name: "cardRolesVisible", label: i18n.get("cardRolesVisible"), value: true},
                {type: "boolean", name: "dueDateVisible", label: i18n.get("dueDateVisible")},
                {type: "boolean", name: "refusedOnlyVisible", label: i18n.get("refusedOnlyVisible")},
                {type: "string", name: "signerRole", label: i18n.get("signerRole"), required: true},
                {type: "string", name: "requiredRoles", label: i18n.get("requiredRoles")},
                {type: "string", name: "visibleRoles", label: i18n.get("visibleRoles")},
                {type: "boolean", name: "hideAttachments", label: i18n.get("hideAttachments")},
                {type: "string", name: "requiredAttachmentTypes", label: i18n.get("requiredAttachmentTypes")},
                {type: "string", name: "formHeight", label: i18n.get("formHeight"), value: 700},
                {type: "boolean", name: "generateBuyerTitles", label: i18n.get("generateBuyerTitles"), value: true},
            ]
        });

        Wf.FormSelect.registerForm("invoke", {
           label: i18n.get("invoke"),
           fields: [
                {type: "wfScriptSelect", name: "script", label: i18n.get("script")},
                {type: "tsScriptModuleSelect", name: "module", label: i18n.get("module")}
              ]
           });

        Wf.FormSelect.registerForm("appointment", {
            label: i18n.get("appointment"),
            fields: []
        });
    }
};

var remotingModules = [
        {
            "name": "StoreCard",
            "label": "msg://StoreCard",
            "description": "msg://StoreCard",
            "category": "remoting",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/remoting_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "viewName",
                        "label": "msg://viewName",
                        "value": ""
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "copyConfigName",
                        "label": "msg://copyConfigName",
                        "value": ""
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "UploadFiles",
            "label": "msg://UploadFiles",
            "description": "msg://UploadFiles",
            "category": "remoting",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/remoting_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "StartProcess",
            "label": "msg://StartProcess",
            "description": "msg://StartProcess",
            "category": "remoting",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/remoting_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "procCode",
                        "label": "msg://procCode",
                        "value": "Endorsement"
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        },
        {
            "name": "SignalProcess",
            "label": "msg://SignalProcess",
            "description": "msg://SignalProcess",
            "category": "remoting",
            "container": {
                "xtype": "Wf.Container",
                "icon": "../thesis/res/icons/remoting_icon.png",
                "width": 250,

                "fields": [
                    {
                        "type": "string",
                        "trim": true,
                        "name": "name",
                        "label": "msg://name",
                        "required": true,
                        "value": "msg://name"
                    },
                    {
                        "type": "string",
                        "trim": true,
                        "name": "signalName",
                        "label": "msg://signalName",
                        "value": "ok"
                    }
                ],

                "optFields": [
                    {
                        "type": "string",
                        "trim": true,
                        "label": "msg://name",
                        "name": "name",
                        "value": "msg://name"
                    }
                ],

                "terminals": [
                    {
                        "name": "in", "direction": [0,-1], "offsetPosition": {"left": 112, "top": -15},
                        "ddConfig": {"type": "in","allowedTypes": ["out"]}
                    },
                    {
                        "name": "out", "direction": [0,1], "offsetPosition": {"left": 112, "bottom": -15},
                        "ddConfig": {"type": "out","allowedTypes": ["in"]}, "alwaysSrc": true, "nMaxWires": 1
                    }
                ]
            }
        }
]

var remotingEnabled = false;

if (remotingEnabled == true) {
    for (var i = 0; i < remotingModules.length; i++) {
	    thesisLanguage.modules.push(remotingModules[i]);
    }
}
