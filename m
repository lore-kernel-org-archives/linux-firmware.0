Return-Path: <SRS0=A/Xl=WG=qualcomm.com=ekangupt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94DCC36000
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Mar 2025 11:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4505C4CEEE; Wed, 19 Mar 2025 11:42:48 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C3D8C4CEE9
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 11:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C3D8C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4liem011989
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 11:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	date:from:message-id:subject:to; s=qcppdkim1; bh=1CSM+okN7VrMCvM
	Sm12Ao57h+uIQdFAkLDm6vOhyZj4=; b=eDLeGcaBNCGUFTBGpF2Q3qUFzwjoqx2
	fOZ0jch8+8+Qjf8JbQhmXOcxxkiCTYfy70fdY9d01/MhwnsH9E3pca3Q6xckTq0R
	0i/pLUwxRMeGh7Eqjm5oGJOmF7+xqYy0A4NsayMRL6oWUC389p9YbCodMTQJmhuy
	/syircqCCypsM4N7EoSRR6LnHP4Mma3ZFn4eV4tBQfJRoe+I4pPaIzYfj4XtdrEU
	Hpj35bCeC/zpAUUJHKReuTYlaRUHaxTI3dOe2dWvDGkUNQ2TgB4YkRuwzywLrYMM
	N/W+sTbmQ5fQn44uG6rjNhXjrYFLs7ulZQnrZjz8WFPFvjLKGHgcZvQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f010n0vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 11:42:46 +0000 (GMT)
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-ekangupt-hyd.qualcomm.com [10.213.98.48])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52JBghb9015957
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 19 Mar 2025 11:42:43 GMT
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2315487)
	id 7192EAE2; Wed, 19 Mar 2025 17:12:42 +0530 (+0530)
Subject: qcom: Add DSP firmware for Qualcomm QCS8300 platform
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Wed, 19 Mar 2025 17:12:42 +0530
Message-Id: <20250319114242.7192EAE2@hu-devc-hyd-u22-c.qualcomm.com>
From: Ekansh Gupta <ekangupt@qualcomm.com>
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aINLGWd0wcnuQ1SwipsHw0OcmZA17bwu
X-Proofpoint-GUID: aINLGWd0wcnuQ1SwipsHw0OcmZA17bwu
X-Authority-Analysis: v=2.4 cv=G50cE8k5 c=1 sm=1 tr=0 ts=67daadb6 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=23xA-znBmewDQZfZvhAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_04,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=693 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1011 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190082

The following changes since commit 0c5a986c6bd6b8cf382379c4f9c844867251bafa:

  qcom: Add DSP firmware for QCS8300 platform (2025-03-19 15:48:48 +0530)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git 

for you to fetch changes up to 0c5a986c6bd6b8cf382379c4f9c844867251bafa:

  qcom: Add DSP firmware for QCS8300 platform (2025-03-19 15:48:48 +0530)

----------------------------------------------------------------
