Return-Path: <SRS0=k+Bp=3U=lenovo.com=vsankar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB46FCAC581
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Sep 2025 03:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8845CC4CEF5; Tue,  9 Sep 2025 03:48:41 +0000 (UTC)
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84D56C4CEF4
	for <linux-firmware@kernel.org>; Tue,  9 Sep 2025 03:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84D56C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Received: from pps.filterd (m0355089.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5890JFte032589;
	Tue, 9 Sep 2025 03:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM202306; bh=EpYNwTA0JdDsGY8O1Lyvt
	+HC5ogIHw8vggTKhemw+Oc=; b=bpRg5xl73cEkMIwmU3P57wmUZk6Yb79kk/6DF
	BUM/zuwWlGGU6g8Ph3JRWFrS72hD41fkCeO+089E7BNq9HL+1+fZ0L6ma/AnaCTT
	zwvVi9IvmIwTbUwzsiFdwvg3WXuSfdgYSLIJ99246hDyARwY1OZlyEQFUXw4nfTP
	UoQ0h5jxRZFQViFe1+C88MvdVZfnv4zVELeFopJVt4LhHf/0ywppLjOQj+dDiktk
	4P9riwEEQE9DrEGuipiEHCoh+ovv9ZPjhlzf0nUa1dV3ar4C4KmTGBy9gKvYKavE
	ltuaWkTIej9TNwz2adKdtWK/M0IQJqKvAmBse+l9oRTW8T0rQ==
Received: from os0p286cu011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4911gnmv85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Sep 2025 03:48:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sb/q68SJ2DpMOD0fk/9EXaA9I//Sv96lKilzKFNosq0YbUoyt3Nm4TIEhyra3GJW+mCMbcQ4gkoUdk/x+MJsRfeuDcskhEzJRVapEENMVmvEkmPLV6EAzjsEdE0pnMvyfm3Dh8UsKxy8x7yZKky4DeQi9Be2Zy2F690coUbRH17ZiKoMtWMyByFfso+bFijdx50nt9qmHM0F9duXE9GZUN7lF1Y/J9+6uZ5hASZeLbgz+l7l868jb4zui+qskgvPBR3CVZPG9shNbBHKfChQWg/j7OIjYxPXdiwRg82JCuJS1X61y9JaQZNl7p8LOxd4ivj4QwVzlpVa6jqJe/pxZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpYNwTA0JdDsGY8O1Lyvt+HC5ogIHw8vggTKhemw+Oc=;
 b=RaUh+dcRCLA/2r9GAIB5AJ/XCUmz0DzpqA+z4lEp3GiGE5VkLSYsZbIgAcfsZHx6p16y9n57WAKZW+slXK3P+4yZ/lvcMaGKU1WDSyGJeevW0TK8y3TUudT2QWsyNR9O3U7wNsjrCzVcC+s+hTGYZbZ5/Yz+GqfinmBiz5McdOpORTKOHg/eYmMbEKO6KNK0pRi1C/0/4tf6yL9t7clqSSXZIneY4o6S7c/9pzsoVmhkuD+EnUbB8av5RtfPa2qIvsOU22zuXxw5snotjgXq+5e09bJ99jK8ZKMH44VvvtP4PY5RPKurQjV7abwi77vgBbtvNx9hAXInE1+y2KJ3VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from TY7PR01MB13655.jpnprd01.prod.outlook.com (2603:1096:405:1ec::8)
 by TYWPR01MB9276.jpnprd01.prod.outlook.com (2603:1096:400:1a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 03:48:28 +0000
Received: from TY7PR01MB13655.jpnprd01.prod.outlook.com
 ([fe80::d01d:e21:ee6e:c5e0]) by TY7PR01MB13655.jpnprd01.prod.outlook.com
 ([fe80::d01d:e21:ee6e:c5e0%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 03:48:28 +0000
From: Vishnu Sankar <vsankar@lenovo.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Mark Pearson <mpearson@lenovo.com>, Vishnu Sankar <vishnuocv@gmail.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH] intel/ish: Add firmware for LENOVO THINKPAD X1 2-in-1 Gen 10
Thread-Topic: [PATCH] intel/ish: Add firmware for LENOVO THINKPAD X1 2-in-1
 Gen 10
Thread-Index: AQHcITvm1ql6CPkhFEG24mzS8lWhJQ==
Date: Tue, 9 Sep 2025 03:48:28 +0000
Message-ID:
 <TY7PR01MB13655444CC485B003D162EAB0D60FA@TY7PR01MB13655.jpnprd01.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB13655:EE_|TYWPR01MB9276:EE_
x-ms-office365-filtering-correlation-id: f95cd732-832f-4fb2-9187-08ddef53bcfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?PXb0UDIOpX0twDPr3UnQUkrNO6LeuAveRx4p7J0Xq6xBivlMxgoKNexeYB?=
 =?iso-8859-1?Q?q+c2A3vjxPOXOwwFY/bwGnMjb3T+Aa2oLFm5JP4iPPVaKszTxMBDe0/lcI?=
 =?iso-8859-1?Q?QdipueTjjUZ3C+bgcwy3krxYDs0X0bMnYbpx38JvucrvujGj7TfWhTyZrH?=
 =?iso-8859-1?Q?+0/Kf7AFuLw2osxUW3xzyOFFt6wZzn9VqolN8JAq+jeIEWNHOoHbyAdO/c?=
 =?iso-8859-1?Q?M6rqj6Dn0ZOwsyVflq78AxS2Zb2sHmnbxXSceu8fN3Pj5WscS9aiB5ecFi?=
 =?iso-8859-1?Q?N/nW0gZ2FMySeSwJzvzZeLd7IODMo0j/R3lKQO5ZqJ6yBGhBa+XGVz9io9?=
 =?iso-8859-1?Q?LTNO+y8oxzU96czSqZQMtPjn6LtQkr7XW/SN1dy4AE4XArZzxUtUz1xn75?=
 =?iso-8859-1?Q?y5FSfOGO1J7QkLQ75bkAlToWvznK6aWzXnSLcTmQZ4N0zUcDah3Pk5XO5g?=
 =?iso-8859-1?Q?I18Z+ZO/hjiX/RSJwTU6qD8cmD8IGgo8lnKJ3QwFikGsittQ6VGe8K91es?=
 =?iso-8859-1?Q?rCz3v+NK3FqOmdoL21y1RD57DT5xhKsLQOV1BaEcoXm2UXHBdbt+FnyvJN?=
 =?iso-8859-1?Q?HE6hCXUs+n2XmSDhR4J0/mCNXAJgZ4YQ1mOC/JD+UjxREBS3AL82KDHDJj?=
 =?iso-8859-1?Q?7fGmtHpjNIGWjNypKWnLyISXrzRHPY+iy9lj3wVgkb/JN5GHQIc0RzSb6R?=
 =?iso-8859-1?Q?rXaRbgmV76Yx6KSEWQ1P7l9svBqb3H5EeFAahk3vlnTXOw0mGAmdi2XyCW?=
 =?iso-8859-1?Q?u6tHe10I59nVHQ6fgFof0vVbvsRkxUTgO1OfE0T05fXgINt/fwwoI9AaZh?=
 =?iso-8859-1?Q?FFw9NhQFI8sRH2xs9ShfAhDuSdu1UCD0H3vikZoz0JY5+Wb5m4suT/I4OW?=
 =?iso-8859-1?Q?0ZPvDiF5kLbyDUB4sz34A57fVr5Tn0fCN2Wnay90I8tX+/QTfDiqCKQysl?=
 =?iso-8859-1?Q?pLYzZQ1nBcnRI/OW9I0bykusChMdyJvqbtyJTUZ7JScrfpI7DyjsvltG6u?=
 =?iso-8859-1?Q?/laA4OVIQBy1YOc9JE2+uUGcFp3cR9A44/O6tNL/nXL8MutIBgHd1ne+37?=
 =?iso-8859-1?Q?KcjQW1AAK+6s7vZGZPL5blblAhdKEeUBI0zQQQq9liyT4/ZndYPKZLnvut?=
 =?iso-8859-1?Q?pXxQ74Vjv1MD8y/jdQXFwapCfITlPHqBWkRcZrkRfhydSv6lbWqRklCNBE?=
 =?iso-8859-1?Q?23hk7l40iU3hgfTofWL4JcD4Z8P20MpIMPXZP0tevkYNGylBOe3kMuz9/P?=
 =?iso-8859-1?Q?bK4UgE3W9FUL56SVFQ4LNb65eIfE7n8EgsXEdyQDQyoPolqhJ/SVBOovc8?=
 =?iso-8859-1?Q?8ghtt/DLBIxYzprQxl1kzbNQnyrUR553cSM8Ntnwn09OZufmd+5sZcGViv?=
 =?iso-8859-1?Q?BkLf8pO3KJevEN/vyxQ/JmnXmDmIMPg9RoLl4rFEERgD/9ERLqEk8sY+2u?=
 =?iso-8859-1?Q?NpLq2QP90aqIDLicxts61SrPysKGyIodnx27Rff8rTiBfFmL8ti/4e8RT2?=
 =?iso-8859-1?Q?kfCU/ZbqFK83TnrBG/Cuk6TG9zuB6cT9VlOBJ9ysvy7o3EhjSWLu0wEB8W?=
 =?iso-8859-1?Q?PzT4Ug0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB13655.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IhejVIT8Dod/5VKiBQN+YB8QtIZCmlEVpynWgq8MaOrxU8f12JQyX9Nobt?=
 =?iso-8859-1?Q?FF/nO2PX4vym47rg8w07/WPuVGiSOJYR2NI7a4m72yNmPf/TQb8D8MUxnd?=
 =?iso-8859-1?Q?hxhqCJZjAie//yyCYrH2YXzujTxLChqsgi4nN0PczLHk3kJwvyR/p+SbgE?=
 =?iso-8859-1?Q?uC2VuMg4O0Y1I3b9MpsiegTBCuz4wOgGL1B2npoba1fQfiMBmwy5TkL+jZ?=
 =?iso-8859-1?Q?Kcwl3xPDHZ3C6quq5xmQsqpnRhWn8yBi40IsSMFaeDQ+SC6xRnJdtsPCa1?=
 =?iso-8859-1?Q?pzJB49a7r+AApA8mDVqWFtvw3NtAVTaajK6fC7RI3E47RCTJE/BTGS+f2N?=
 =?iso-8859-1?Q?MAGZeFBQ+iwABmWhrNEVKpZfFdlOFOytldR9R8UFvZoqcnlV8DPw5TG1fP?=
 =?iso-8859-1?Q?QY3d7FpqAx4q9i+B03jhQMnIBuJd4xe/i/c5o5pyptYFkCC11YK4nFL6u/?=
 =?iso-8859-1?Q?+bovZ21S95aQ6cSJB2pFee4ZVmB6WT8Cn1zt14Yc6mDQaNVKTCSLIjNR84?=
 =?iso-8859-1?Q?ELJk0iZaNtYqcWgEEE5Wc0h/zwRnAXiIFXXYYueuSU4E0rqlOygejm7XoA?=
 =?iso-8859-1?Q?UmCBuNdJ+WeEf4mbaS5y3hneb9bTvz0ak69ryS1chcnI9t2s+5YV42G6IU?=
 =?iso-8859-1?Q?FX6zQ/9WzEwc1XIJKL2iiTvFt3w5iVVcbfPbdn8NyecoipfV0b3qPWx8B1?=
 =?iso-8859-1?Q?iVu0uA8HBjtUKZOHSxXEBPC+WDJE2VStm49PhhglwTJ1Xd2r6IcYnuFtS/?=
 =?iso-8859-1?Q?HIZidqOIe/JWyrWrqkg4m+6jBEJ+W20o5OJ03rFGf8aCJ/SbNB4LvZt96f?=
 =?iso-8859-1?Q?r2SKTrjv5JmZFIOIXu6r/4JxPqSVH698OKrBFqhEYdWA65WUiO8QD2lfre?=
 =?iso-8859-1?Q?qXz1F76lCYOzk7wbN9qFpwT6ZO68XlS0wyjEau/NGpTn7w3EKrqBDFs2JX?=
 =?iso-8859-1?Q?GHUw0y4/wegzLlbeSUaPrEDWqlv6ZJIRrrbDEs7QIPpaIfEbV3RwJGuG43?=
 =?iso-8859-1?Q?zqFOrA2VVcQX/VAxmHJFFhqm7cPUDxSKe2UJl7sMD9BqunJweBIN0nqPbX?=
 =?iso-8859-1?Q?Ylm88Mur/vTe6DCeNoaDWTPiK8sWnO/BvhnFiG9cfpa+7uhpcGGbMlaKwr?=
 =?iso-8859-1?Q?ri+ho9RzEIzpmh2IsY0CV4eF/IdJjjtzGV+oGUWZ26JH+6GJk1MjRU7HzC?=
 =?iso-8859-1?Q?QqS2Jm0f9ZiuZaih+NlpKW3NU/94lnzzWOJ21UUKyNAXW2blnVd3llSAfW?=
 =?iso-8859-1?Q?91YDO+DYcMqcfA7IXJLjwL3/jkH/ha4ptQPXHmazv5uXGvhIgmfPBQ39aW?=
 =?iso-8859-1?Q?CGITp6Rlo1/Vdz46TRZxJ/V0kmOuGMi6FJd2W17CgCY5s4j4IgCa5r2Ju/?=
 =?iso-8859-1?Q?KLPNvCsfp9qJh+NqlT9g/N7BzffWzF06UtZmbrbTtaJbxFBLTdbW7eGMTr?=
 =?iso-8859-1?Q?xJaPf+JbOd6wJbsUqF7BiMbAn0FwZtI/ykD+Khg2u6Buih++zdgTm5Dc8v?=
 =?iso-8859-1?Q?/vasruTfmFKNy1C/Y+zkR81z2eYOsiMpYHilQLM9titDqYVVRlS2e2bCr+?=
 =?iso-8859-1?Q?YmsjocPfs6s5BSngFKSxisPvLMuX5QXDV9qUwEpwQzRfrS2rhY4Xe90isn?=
 =?iso-8859-1?Q?vllTPJ/hBXI+KzaQyDA7YfrtSUw3J3uwxjo1p0x7baDD87B4pwaDkewDnL?=
 =?iso-8859-1?Q?5ffzl59zSmO7H2eZBRqEfrP6uC/HuGWbi56Po+vU?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB13655.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f95cd732-832f-4fb2-9187-08ddef53bcfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 03:48:28.8067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5T5nC/0LC/jjMoWaYiOXUz2VPlIb4+LDM1hlTcPns89K8GpuM6z5qFY9wKqIjU8mRzc/o6dukpA501EGsKtPYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9276
X-Proofpoint-ORIG-GUID: CtFu3AH_3zEtNhe5qL8ZHtCYPJm4PkvQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA3MDAyNSBTYWx0ZWRfXy5IU5GhIasQB
 JnyZxqpXfcv1bS2N+wIFtTDl1YXBTO1GHeeCFglm5JEQXccrlWqGXkMLmm3t9x0/JaTOsIB+utX
 NloR8a4DGBJtO6Ab9qB3PLtyo98DYbzApEhIU7+xsxr24zT0RcNCnTCFl0jJQfmiOvIw4u3ijIU
 KP8c4P2DEfoolrXOF+uDGrrqPYvL/EviT7tptE7QpIlbnBhJBXTjdkiJ0tKHtyYpbS+ggFhPKAX
 Zoax4IqivEBu58agHkln9ENuCMyYuNOYqZ44/1eUbmmXq/dpNY74b7205wCV7aHl0xgfuWuv7nI
 G/UYK8jw6sEYs6YWR6WE5VGw3OwVI9VdzUN4WBqUS5eWWFC9QQQkx6TcRFkpZl+R4FWcN40LdXM
 Cuh7VvOx
X-Authority-Analysis: v=2.4 cv=bopMBFai c=1 sm=1 tr=0 ts=68bfa390 cx=c_pps
 a=AAdb9D5nP1IVdAyNgjIkkg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=8k6WQxmsAAAA:8
 a=146I3tDNKaSnFtblYVgA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: CtFu3AH_3zEtNhe5qL8ZHtCYPJm4PkvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1011 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509070025

Hi linux-firmware maintainers,=0A=
=0A=
Please consider this patch to add a new firmware blob for the Intel ISH sub=
system on certain Lenovo platforms.=0A=
=0A=
The merge request is here:=0A=
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/683=0A=
=0A=
Commit message:=0A=
------------------=0A=
Add firmware to support Lenovo ThinkPad X1 2-in-1 Gen10.=0A=
=0A=
Version 5.8.4.7720.=0A=
A new LICENCE file LICENCE.lenovo is created.=0A=
Signed-off-by: Vishnu Sankar vishnuocv@gmail.com=0A=
=0A=
Signed-off-by: Vishnu Sankar vsankar@lenovo.com=0A=
------------------=0A=
________________________________________=0A=
Vishnu Sankar=0A=
=0A=
    Staff Engineer, SW=0A=
=0A=
    Minatomirai Center=0A=
    Bldg, 21F=0A=
=0A=
    3-6-1 Minatomirai, Nishi-ku, Yokohama, Kanagawa=0A=
=0A=
    220-0012 JAPAN=0A=
=0A=
=0A=
=0A=
    Solutions=0A=
    Development=0A=
=0A=
    Lenovo Japan=0A=
=0A=
=0A=
    vsankar@lenovo.com=0A=
=A0=0A=
Lenovo.com=0A=
=0A=
    Facebook=A0|=A0Instagram=A0|=A0LinkedIn=A0|=A0TikTok=A0|=A0X=A0|=A0YouT=
ube=A0|=A0Privacy=0A=
=A0=0A=
=A0=
