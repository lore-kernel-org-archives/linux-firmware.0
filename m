Return-Path: <SRS0=6Nqk=YO=oss.qualcomm.com=viken.dadhaniya@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16A8C5B549
	for <linux-firmware@archiver.kernel.org>; Fri, 30 May 2025 09:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BFCBC4CEEB; Fri, 30 May 2025 09:24:53 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6706FC4CEEE
	for <linux-firmware@kernel.org>; Fri, 30 May 2025 09:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6706FC4CEEE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U1pvSx005156
	for <linux-firmware@kernel.org>; Fri, 30 May 2025 09:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1uWYn0FpNuBhEs0GI3QckU
	SZIkH6SoptN4Wobls1TAM=; b=kCiE21ZKsLI0VSTA3QgKO0Hc/Q9UVtezdt7a42
	8ZDaGcp+DmdkCNXqO9vATNgqqx5knbG4Y0mxMwbdKB3iuUOLBaxC3UCjpcSio3mV
	bXpY2mvf3nEytG6lUoDyaEis2q3M8DQmru1nU3WxqKBPXTl7y4NzS/Yo24Gb3h2o
	hxM6jFxcj5bBDynFioBD2z/9iAzrxqczixGmu4MYarO5cvAsI7WWyG5x7DKErRIZ
	Sj4xdFnjXSsC54/txVAo2Huw/0DOKfDzffQJssIVzc5YMd5SR066zOL2f2mwtVbF
	iepcxFgvSlFXXxW8O/V0YPwKafrzHcvJRWipQZGUQpJLpy4w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek8awm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 30 May 2025 09:24:50 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-740774348f6so1778291b3a.1
        for <linux-firmware@kernel.org>; Fri, 30 May 2025 02:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748597089; x=1749201889;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uWYn0FpNuBhEs0GI3QckUSZIkH6SoptN4Wobls1TAM=;
        b=O+IeaDaSMYtG0ZWRanED6lVknAc1j8JbkLiTwZRinMgi3TjZGBCSMR80O+00QLnZ0K
         jtAQoN3jLgNYIXvZJcnbQWnQvk8LUXLX67eCKose7qeBSImI/OgM1eVUXfW4/I70AlH2
         ZtWrAa/A8GE2WxMNMRFp3BTLK4AmcABj6RKMoM2Ogoa/Fi3OC96p49U3x9xrqwI8yLK2
         ddW5MyHL0tbwBdzLezHSSAQN998m+Z+8KT6zF0pQSfxXU64HM2aC2uEfkYLHDLwMAzhE
         GkwXZU6Ff+q8v97LxTGvOsIYhFecqP/iwzwD+ROUgw+KC9jpuLLp+6BqsBv4U1dnCay6
         sfUg==
X-Gm-Message-State: AOJu0Yxy2q/vOk8yKcuziqsDOGyIM17B2jWEeXj6qcpHoek0ZPdQctgL
	hI4jI6648cOuJOEvxJeoQ+Nuwo1BGjpdWOZ0zvB5kB+I+a8jtmEsvi/OfwWTKNWaGmwddnR+6R3
	s5VsX0LMWGupvNMUdsIjBSDbSVR779zmahEMRdYhiO1Yeo/sqdc57GIANS9sgTicUaNzM1po=
X-Gm-Gg: ASbGncsToSNkmnxcNJozMpykjX43rb5Ep+DsgSdZU3cgz8q57+mFONKc3JkC2YPk7lc
	TMHw3PKKZ2pDIxdPwwj9rtYRuBWW4H1Hl1k+dSJcs2alFkwRM3nUWpIMQAA5f97nrsd9qHPmhLI
	RA3Mr21L/g+TOjC0E8XHMrox+vuVqxGgOoZS4SKB3dWOEowlGs4POr9f34OLbqmIjDizA39ZecB
	UL/VqpeUHwg18j5kYFs39sTMxqaFvfP3q6tev+ciE6mFhQZBh78LNx8vecB3h1448TDuCnXpXFG
	ki46PTVEbZUeq+pEXf3n+se+KPKMPkX1wXIj7YJXTn4U
X-Received: by 2002:a05:6a21:110:b0:21a:d503:f47c with SMTP id adf61e73a8af0-21ae00b15c1mr1777335637.28.1748597089556;
        Fri, 30 May 2025 02:24:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOJ5l51eAMSegknK+FWZcMQpbr6cZPK2BL1Qk6jQnZbBFtQDR3IkDm2fbo+tVInNHaxdN6ZA==
X-Received: by 2002:a05:6a21:110:b0:21a:d503:f47c with SMTP id adf61e73a8af0-21ae00b15c1mr1777314637.28.1748597089160;
        Fri, 30 May 2025 02:24:49 -0700 (PDT)
Received: from [192.168.0.105] ([49.205.253.210])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb4834sm1006923a12.74.2025.05.30.02.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 02:24:48 -0700 (PDT)
Message-ID: <7fc47d8c-36c4-4925-930d-67472cfb0796@oss.qualcomm.com>
Date: Fri, 30 May 2025 14:54:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: qcom: add QUPv3 firmware for QCS8300 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=68397962 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Y0tdpkBsm2CiBl8ZTCiC4g==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=xMndFDyVytR4maIA0p0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: WYvz4nsl3otvenN_tRhBAGR_GqKZAN2a
X-Proofpoint-GUID: WYvz4nsl3otvenN_tRhBAGR_GqKZAN2a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA4MCBTYWx0ZWRfX8xFt0gz404rV
 Ap4o+QCvuh43Na+KBWTYc66zQHu4wQbcGziN45lNrN1o2e3iH16ftHxYcKqYNl+IBPNWrSC0z5W
 IMS5uSOxWNf243+JQtTSVwrDLnqnDIEDkekHxLB5eeXuLsGr7eP/sYLde1/u77lnDUYDYH/EKyS
 MV0r9Uqo6QZ8RKaksNrW4E4/mwqGvdUGKZolVZRqwk/ODx/WvX46YyqcDfSnu/OzbKafBOluoYp
 6wZNf01TLOzj5XsBkW72JrurM14+E3rNnPG/aNFtxKUQFdBPZPm634hJMvBAhuHPhy13P9+PvM0
 4/3ysVcADCKpD0O7PtDmfnt6SQzgeFOJR7Xs+ulGofWTej/bWlh1t0S7O5nQdKDmEWs1+2QEoKV
 oc5ov7M9fhFPC1GY8QdAxbR40LykgYb8h9sqdq0fAoiNA9Xm1pMSS2n3kFw7oVnn1oAQakUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=596 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300080

The following changes since commit bc0d1ef315fc5a71440a0dc3a00cbdd7daa3cf5c:

   Merge branch 'robot/patch-0-1748572750' into 'main' (2025-05-30 
04:26:50 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qupv3-fw-qcs8300

for you to fetch changes up to 7143ab41c85907254d5c4fd0e7d987b50e7a1b71:

   qcom: add QUPv3 firmware for QCS8300 platform (2025-05-30 14:33:19 +0530)

----------------------------------------------------------------
Viken Dadhaniya (1):
       qcom: add QUPv3 firmware for QCS8300 platform

  WHENCE                   |   1 +
  qcom/qcs8300/qupv3fw.elf | Bin 0 -> 55541 bytes
  2 files changed, 1 insertion(+)
  create mode 100644 qcom/qcs8300/qupv3fw.elf

