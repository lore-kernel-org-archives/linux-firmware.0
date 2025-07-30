Return-Path: <SRS0=Uv2v=2L=qti.qualcomm.com=vkasinat@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77461C87FCB
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Jul 2025 10:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53FA1C4CEF8; Wed, 30 Jul 2025 10:17:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A5EBC4CEE7
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 10:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A5EBC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56U6S732023381
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 10:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=5EVsiePjWhV68/A8Bq7+bzHvCICnrSEkwdFW6nxvyQg=; b=Bn
	JPieA/mFx+/fO/T8i8g1s7+NN8ezQvLemswkOrRdlbbTpKBsN14D3ksZf6d0CcOT
	S5k0ujSdt9bpYAP7gTuERxlfo9+M8ZDv7uQfhQeqW1U/TRUf/zOflYTaq198/uLJ
	t5POHKQYegQkza3NIqVFArzXdbEXlqo78sLZSeJ/NUknLD/ZPe/+aRMs+OTmu0Pt
	92krrmg0meBntBt+fLW41C9KIdrT6+c1QsqRbfu/XsWw8bMHeIzmTQE/l2leScx7
	4XsO6WuIUG9hSYVFCm5prd6akM7H/miQu4ztn7nmaLGwJxOIQcmzJXyqEUisqiWo
	0RnkPGRPDtB1yzEbSv6A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xuah1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 30 Jul 2025 10:17:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QihgCO/+jVsed6iUIrMYCgqC5oGuJGtwBQb93YXFSux5loJ94MQ3lLo0y5L4VRjDtfDiNin1Uyc+YIZFIT6HjZuVliSypE2qhl22/Fq3uXphl2tDKj29G/N94idKLDwv0mR1/hmVNd4jzimSGnochB9aoCgAjswgsIIMzzOmNzd3Jfgtx4feG+i5tooSKqqsBJLG/HCr7+jaOpoeOZWZ/RChNideZRItvScVbDImeK7EjA4YO9mxGqyFT98CwMlwdMd/B81Vz01TQrnmF48J6I8DLuJ+1eKOxX6LUe+6XVPU7J6Zj0uvkE9zi0lj+2hgn8FKAgLVbrxo1aFvcRbfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EVsiePjWhV68/A8Bq7+bzHvCICnrSEkwdFW6nxvyQg=;
 b=avPlktu3J0rjBCLkWaRR9ekLk/mb0sASQvf4JFLt1mk/PpG8qdEJVAXSizyTji2YMcMLTLQSGXUntRpvVm78w8ODZtQsIJv4UGoYppJ+eACgL2lLofRt4G1x6RzkvRrqUjaR8M0UxJHSBsz+qzk6XuMS+BFIJTtimeAE21b3+NGPnUzsgnDJwxQvHylsxPcP08gNTCy89L9wmXLniqQFA20srQoppuQEcWyemwXvlOPZWouCyKPyqRA828qB3r2BlSnhPhzBH4UoixTzvQylJWDT3HUU30uIBtdWJMynDga9+v/b6ILEGrZhvfnvMXL1G0jG/byujhQfCPWgU+grEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from IA0PR02MB9917.namprd02.prod.outlook.com (2603:10b6:208:48e::9)
 by LV8PR02MB10017.namprd02.prod.outlook.com (2603:10b6:408:185::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 10:17:09 +0000
Received: from IA0PR02MB9917.namprd02.prod.outlook.com
 ([fe80::2ac7:e03f:a815:a444]) by IA0PR02MB9917.namprd02.prod.outlook.com
 ([fe80::2ac7:e03f:a815:a444%5]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 10:17:08 +0000
From: Venkata Kota <vkasinat@qti.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>
Subject: qcom: Update DSP firmware for qcm6490 platform
Thread-Topic: qcom: Update DSP firmware for qcm6490 platform
Thread-Index: AQHcATre+S+JgMDDcEK2bm4WvWUyjA==
Date: Wed, 30 Jul 2025 10:17:08 +0000
Message-ID:
 <IA0PR02MB99174E0D81269451D2FB28CDEF24A@IA0PR02MB9917.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR02MB9917:EE_|LV8PR02MB10017:EE_
x-ms-office365-filtering-correlation-id: bf434df3-ce44-42f4-8ed2-08ddcf523de7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|13003099007|8096899003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Pj2sfe/7zATsbw7pZ4/sCsFLrakGQSnA230FszPhhrNRdRs7vYI2n2uU8s?=
 =?iso-8859-1?Q?GwSRClIqrg6IVWyLo+2hwPo55e8b2fE3ceTtMxC0KXD8ijjro+v0eSNBZW?=
 =?iso-8859-1?Q?DvdS5X/awz6YJEwjISgFnPKUYRSLoXbacTr0uWzS5KYQcBqzimN+6Bi/l9?=
 =?iso-8859-1?Q?AxC2ueqKz/yz5+e3j+gS+/sE4LRmkdEZfJoNb/qbsVd+IjzUrONcTsXIx+?=
 =?iso-8859-1?Q?Xkzv3fFHPZPB5n+X1pHUgU3rSaL6ifjSihv78NtwEsWHZz2M6FTsdcCopv?=
 =?iso-8859-1?Q?OoAXdnBBknfmIY9Khk0aI4q5j/wvXSa15mNO2cRdgqNpB65enhe2MHfztQ?=
 =?iso-8859-1?Q?xy1w2d8UteqYMiYYkZ6plDJ2rjm6hYl22HUL6qCZNgn4vP3w9wCVurmweW?=
 =?iso-8859-1?Q?cCwJczyXFasOMedUsWprN6gwAj7QSAMebWqZ/TCX9kYV0T/v2D6WCtZtt0?=
 =?iso-8859-1?Q?Az50UWN0fkQzxALslY5O3x/ltUpRQnEubAkYCVazLm5mI4zT562Ja/hopM?=
 =?iso-8859-1?Q?Sjv6Rw0P5tZajOgD8SIa8xrhDaeJNoD48yQk2PV3fHm3tP4F7FkREIZsc2?=
 =?iso-8859-1?Q?rzUdUdjbv5+xP8MXtLSdKSAUowxKxQ0RfB91YsscjPX+rACGYZiLsGmpJV?=
 =?iso-8859-1?Q?INRdklvJyZ16IerUv8lLBnJwNx/BXPE50yS12Xx46nTvR5n4A7FrL+2eg5?=
 =?iso-8859-1?Q?a7peQbLNvgL+epA47JjK14DMClFzjUreL8sk6/+Nf+zgnYHp2tYz5cbqMh?=
 =?iso-8859-1?Q?DI46YZDcDQV/WhpyYJkONfWmsN2pYl4c+egbCIwUOt6T45pIR86//V5qoV?=
 =?iso-8859-1?Q?ZbyhoCTkNE3vsEMwaRo8fv1NU/IlcaXZTHtDDG1NBcYptGFZleBWb0QmGz?=
 =?iso-8859-1?Q?rkw3CekfZ7qICbxcbIsHB8C0Tf/DKYOhMQ88aWM3S6IINJqqXwMp6Vcv8O?=
 =?iso-8859-1?Q?gTLWDTz05At387glO2zrgXD5xDNgBqU0UwztWRqQWo+KnToT4kjgTP1n+2?=
 =?iso-8859-1?Q?OXLCX9c+Za/sReoKn8fvaIlrOsjef01BM70SaaRYEEz9WjON0vsKH8L4o2?=
 =?iso-8859-1?Q?I7oAAf6BGFFXZuMuTAUMpsLF11jfVoUIK5hhf2Y7ImswXrBQNnXdjIsL9G?=
 =?iso-8859-1?Q?CiHLFufaiVD2cjizk0+TURLKPh67zLFp/x1Z1SdkhYoYF5GfFuFu7Zn7Le?=
 =?iso-8859-1?Q?16hLlphifJP1C+Ih/JhzlxTg4WDH0Wv493ySex7uBn2QXFSKOU0IPAZWk2?=
 =?iso-8859-1?Q?OPKTe+yKOiSAfvs1D5dsvWWrSrt7AlZSIvjPHHoLT6F0t10zNpDLIwprnV?=
 =?iso-8859-1?Q?8uyzo2dAzGqhrGdDOe9jxDld873TIEWuCWxwMuRsm+biVxPfUqqq2+GoGC?=
 =?iso-8859-1?Q?5a/oVz+I7eu+HOxlcQSMVmCTInmkgS0Fo+CWnqHujKpbA0Mt6hW9h/28Q8?=
 =?iso-8859-1?Q?iwF/n9rk6ZRnT+gx6M6TZmsB0p7ZRgI6V20VT++FA2yomMx35QzB4aauBo?=
 =?iso-8859-1?Q?k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR02MB9917.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(13003099007)(8096899003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hHtBhdMcvNOwgSJFtofIbxcqZuE8MldleHV8zWgGGq+GEj6/tGeSJhbqW/?=
 =?iso-8859-1?Q?bsz1xWf+1l8G3XEB0v9CxNqhkk4GYBMMcibgDfIAT0DFn6TCqEjKWdZiBO?=
 =?iso-8859-1?Q?IKLRH6H4dN9nztB1DJxaiLh5oTygw1o9JhlvhCMtpyhVF3CbLEGsNDSvHz?=
 =?iso-8859-1?Q?mQvrvWWllHOYBEvOz7QXHc24GH3VrUdPG60SBXRCmB689AmE1xU8qZ7kvs?=
 =?iso-8859-1?Q?OXFjcEtdpZXS93LBrROYCA8VCsDCh77Gf9TxA8QXnAagF86u9iYjir4NkV?=
 =?iso-8859-1?Q?x1iXCjq3jwSBEClm4kss+98pyChlV2SjWKGhhVJwv9jjLOt4qRZ23iKGom?=
 =?iso-8859-1?Q?cnSqIY7iodhM/BGon24mBJLQtIjPGhaL97WB9tOu/BnIv/Waw6vaEPRbPx?=
 =?iso-8859-1?Q?OIbM4ROZnhaxC7l1Mg5VMTrc5Ec21XTGiUv4hae7QOYgxZrM2AtAGj0kh8?=
 =?iso-8859-1?Q?a9+ignuAlVKjmFkr9dCMj8KGc3cPAfFnY5zs8C7seUODtCM8Z1r4u4wkpu?=
 =?iso-8859-1?Q?KTEytIFigTQ30cnidSLqnfXmW4cyNQrOhK36Ix9vLnr7JhO6ymM6WDgPXO?=
 =?iso-8859-1?Q?lv5IlmsW0kMEAFCc89UImjLZ67ZkDptl/IYiqk8HkEvnGy4ftWBI0GwRvB?=
 =?iso-8859-1?Q?P7p0SX/Lq7YmtN5sPDgLlmfu1chN0fkyAbnAisJcGzQficpQBrYJnRkE2R?=
 =?iso-8859-1?Q?g5bWkvpgX6941+LtOPEh2HA3ZuiQ0n0qBjisiILKyZV5VnN430N5wcA1z0?=
 =?iso-8859-1?Q?5NK4SdrMe9N14P4nFO71Qv2lXI//sXkiB3cK3DeL7BcyYRra/e3UDbLTUa?=
 =?iso-8859-1?Q?uT9QrglkGNEuxwuNA0LbSSjK/K17wb1lcbESZyJNUnLcb46+Iunq39B2BX?=
 =?iso-8859-1?Q?FKjQ7PXZClx4Ef5B4H4tFI7uwiZKTZHompOludiUNWygb7av3yUXErA0DF?=
 =?iso-8859-1?Q?bKeoZm0Y4Pg4DfZNH1QS3LZSvWFncdIwV461+Dc1V9Oc9+am1s0uopw5wz?=
 =?iso-8859-1?Q?/j9+3dmgcTn/TFlggx0hcIqpW7ao8cDvEoscazxwFNPk6SSZ/BnZ9oIdYj?=
 =?iso-8859-1?Q?MBlx37ZvtTvsIU56E8y91ucnB3yBFt49BrmRaxngyBlklbyVvRZ2ReSIeb?=
 =?iso-8859-1?Q?gpa5iPnQiuYErOZyVVI5D6mgquvCm11cdiGO5lHALffQ1Gq1r9CqVQfFzU?=
 =?iso-8859-1?Q?dhV0TQ9dC4K2Qsm0dFZh8urr1cC8dHLCNTw44kf0tToRIrUhqI8mNFgzus?=
 =?iso-8859-1?Q?c4x/th5vfJZm5+nefyOb3+c5ECWtwuKXC3Bds4q4y3wpK69sKNUkfUpeo7?=
 =?iso-8859-1?Q?yC3OSpknsi1iVeK8z/US1MNSWcDvk04Lel4Vhi3Jj3jOu87Mk3TCEKzp15?=
 =?iso-8859-1?Q?p6mZBpMdwCf50lEpdHzqXrxZFN4HsI3uusd/rCkBA8rLFarWgsfe2IAVAb?=
 =?iso-8859-1?Q?eFXSzfOzZMRRTUPiq5kmh8SiVc29e+G/wH3eja8M1hhqKeQyx7tkISANE5?=
 =?iso-8859-1?Q?JM4UWF8OHQHQdOewSEnevoENbzlT1NmoGmvc61zP/vZMm72JPIZTcKdMoA?=
 =?iso-8859-1?Q?aHvU5w+T45jp1U6g/q5zeHMbsHL26vkR+hC11NInGUuxTSl8zVDrpmC0yb?=
 =?iso-8859-1?Q?6BhbIuSKkaMrn7eBjKOM95vaUhG9SFp4Vb?=
Content-Type: multipart/alternative;
	boundary="_000_IA0PR02MB99174E0D81269451D2FB28CDEF24AIA0PR02MB9917namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ztvAcpGAI/I+2h7MgHsvlQLgJXtCTbeSl38crKVJIAlAWfhDSy7M7erLmjGMRbiuaAmNpaeSpUYPdQVG1eXPpCYA6pYnKteK1gPSKwqubxVgqj20fMTqS1KKshMIFZS1XQks6QNjJwC7N2lxigOtOq/hHXvUgnS7xeb3mo1yIgwtlF4j0p+V1zc+AZjBC0FtKwwpHVkdPcXJTwUitUb9zTtT0AlMcViMEQtRUMPJN3PDP6NsXnJI72S31+QU/8R7UhIFASOaie/XAfOLiiuRH8tYuTXScgmI0eXLuJ5y1eKUwIo3seK4Ntc7dSM1F/LQZv2jqRmS7cgS9KemOPv4GJDQhfiaMGw/jCtC8a9DcxEhiVahfqCWBfXnZw+50vYs8ylP6I0GgwJJdbDE4B1KJRemOLjImBQLCR8W9XSbPORvWD2+0Unqfahm3pR9RF8QjyIdIjfLFjWi/FC/udqlxZetKYzi69iFVn39MRvqB1pMLLq1tATJICKnpcCb98KyBZVqf36noon0kEXxrVsVix78W1tDBU8retN2nrP91fKFGFHTLk2r/7sbHATXFXIEAgPoaTMYfyvvnetOSlf2fYnzOEsnHYdB9EpHjvpc/38Cf43wg5kL3fydvdDfT9K7
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR02MB9917.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf434df3-ce44-42f4-8ed2-08ddcf523de7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 10:17:08.9181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NY8VkKp/FtYypBSIMgxc1cRKsSh7LNzGgqz5M44r19B12OC2wUseXp0BdNzj1m7bD+vft8lbUhB2ZDYD7kkbreHyB9x85XrCR5kLrp3e4Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR02MB10017
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=6889f128 cx=c_pps
 a=nskeBUqQUen4dZUz4TdP1w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=qC_FGOx9AAAA:8 a=pFOjCOo1pOwVxMsLl00A:9 a=wPNLvfGTeEIA:10
 a=qHbCieABnTAmBUsGaMwA:9 a=DABWvpeksG8BiU7b:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: paZ--ZW938z-xhDVgDpZtJA9vyyLglWp
X-Proofpoint-GUID: paZ--ZW938z-xhDVgDpZtJA9vyyLglWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA3MiBTYWx0ZWRfX4TUndXHMlku/
 PiNs//t1EeY1qucMh4tyZ4PtI/JFRfRgjwa8AOD+Id1GCW+5wvPPy+8TegHXldCLcJ9PpgTwc9k
 94BShFSerA4SH9LWsWU/T6v3uNPq7XlaexAB79bn5zEY2ktV23onkvrlXLXT2MVCroeC5F+hZNL
 UreYH0856yyty+4Pik+C+f44mJ7+C6pjGJQh3zCQ3CBsaxqG3mfMqP3gmVw2z7dP4aihTpho41P
 lh8xG74lyxJfs72Th0yqcuWMuqR7gragw5EYu3GSpsghho9wSQyGXvuA4t0FN9E1DYukFXoLpKS
 tRNk37827Vg4n8iWhDUPK9iDEexBjYivHANHSQeBxeVY9Z5kLyZHL0nxceg7e2GB7EBIWU6fou8
 QV0HdejhuHVCNoutdK8+Hjs7GN8s8dFWRp00A2R7/5mXiEohn5ZzUrFEwwQpoGEJi4tgBBxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_04,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=830
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300072

--_000_IA0PR02MB99174E0D81269451D2FB28CDEF24AIA0PR02MB9917namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8=
:

  Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:22 +00=
00)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp-fw-qcm=
6490

for you to fetch changes up to dc2546bbb03c1d58855ac889de24e96a95d0d674:

  qcom: Update DSP firmware for qcm6490 platform Update adsp and cdsp0 firm=
ware for Qualcomm QCS6490 Platform (2025-07-30 14:35:15 +0530)

----------------------------------------------------------------
Venkata Kota (1):
      qcom: Update DSP firmware for qcm6490 platform Update adsp and cdsp0 =
firmware for Qualcomm QCS6490 Platform

WHENCE                |   4 ++--
qcom/qcm6490/adsp.mbn | Bin 12079548 -> 12693084 bytes
qcom/qcm6490/cdsp.mbn | Bin 3637248 -> 3637248 bytes
3 files changed, 2 insertions(+), 2 deletions(-)
vkasinat@hu-vkasinat-hyd:/local/mnt/workspace/dspfw-upstream/linux-firmware=
$
CodeLinaro / linux-kernel / linux-firmware =B7 GitLab
CodeLinaro



--_000_IA0PR02MB99174E0D81269451D2FB28CDEF24AIA0PR02MB9917namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The following changes since commit 910c190740916a9969ad5105137fb88ae4ce34c8=
:</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp; Merge branch 'intel/dmc/xe3lpd/2.29' into 'main' (2025-07-30 00:18:2=
2 +0000)</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
are available in the Git repository at:</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp; <a rel=3D"noreferrer noopener" title=3D"https://git.codelinaro.org/c=
lo/linux-kernel/linux-firmware.git" class=3D"OWAAutoLink" id=3D"OWAa7a3cad2=
-16e9-7027-18fc-5fbe95c1ebb8" target=3D"_blank" href=3D"https://git.codelin=
aro.org/clo/linux-kernel/linux-firmware.git">
https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git</a>&nbsp;dsp=
-fw-qcm6490</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
for you to fetch changes up to dc2546bbb03c1d58855ac889de24e96a95d0d674:</d=
iv>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp; qcom: Update DSP firmware for qcm6490 platform Update adsp and cdsp0=
 firmware for Qualcomm QCS6490 Platform (2025-07-30 14:35:15 +0530)</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
----------------------------------------------------------------<br>
Venkata Kota (1):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; qcom: Update DSP firmware for qcm6490 platfo=
rm Update adsp and cdsp0 firmware for Qualcomm QCS6490 Platform</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 11pt; color: rgb(0, 0, 0);">
WHENCE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 ++--<br>
qcom/qcm6490/adsp.mbn | Bin 12079548 -&gt; 12693084 bytes<br>
qcom/qcm6490/cdsp.mbn | Bin 3637248 -&gt; 3637248 bytes<br>
3 files changed, 2 insertions(+), 2 deletions(-)<br>
vkasinat@hu-vkasinat-hyd:/local/mnt/workspace/dspfw-upstream/linux-firmware=
$</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);">
CodeLinaro / linux-kernel / linux-firmware =B7 GitLab</div>
<div style=3D"margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MS=
FontService, Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0,=
 0, 0);">
CodeLinaro</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
</body>
</html>

--_000_IA0PR02MB99174E0D81269451D2FB28CDEF24AIA0PR02MB9917namp_--
