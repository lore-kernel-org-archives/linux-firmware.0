Return-Path: <SRS0=/4Hy=4R=oss.qualcomm.com=rajesh.kemisetti@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686FFCCA470
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Oct 2025 20:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3896CC4CEF9; Wed,  8 Oct 2025 20:38:34 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5476DC4CEE7
	for <linux-firmware@kernel.org>; Wed,  8 Oct 2025 20:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5476DC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5Gek004415
	for <linux-firmware@kernel.org>; Wed, 8 Oct 2025 20:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GwJY6xllk6z8S/4H8mGcLP
	/LHHwohhR5YlNtBxgNq7s=; b=gz7h9KAimP3BM7CriqqBmIkW+sBg5RQIvbc4Ii
	PPbvCCTm/7KBE/hVRSINnr4MKAJ4KyhvSGLK+Kpg9TOTPUp5wtlv847GOzKu+vM3
	PbJUJil9LhNDoUeiOjCtx1TnZW3FSvj0vO8ou7mV247kF3njuvLe3LHxfreQSOcf
	JZP3/qdDymOLbBpVFAYWs0tTyj7vmJ49VaP6GA6uylWJbOtJKuCHINSrQ18YZ+3C
	7siJx8lBG6yDwG7Q/GcWtAqMm+J0arHtKHvmVLyrp8lMKRidWUE5p6zlSf7cGQmA
	AcRZoUuJ08XFbeCwNwrrfsEvCmYq5dz/45rxjcL/bM2nLtWg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4krh46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 08 Oct 2025 20:38:32 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781253de15aso685841b3a.2
        for <linux-firmware@kernel.org>; Wed, 08 Oct 2025 13:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759955911; x=1760560711;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GwJY6xllk6z8S/4H8mGcLP/LHHwohhR5YlNtBxgNq7s=;
        b=ZFZQnf+8obB46u7hgDNrk8NIhdwb5YNhjMSVHTWhQEibzfZoT+NaAaunLv8QjhR9i9
         BWUyPpjShfnd2mM2oUf8SODbWFZmFseq4YR3sl+QNHIISd/oswy6ozb9vZfvP1btLymh
         ZV+rYqRs0mbKPTz1WQ/7uAwbTFTXYlBmV0GLqVgO0v0unHAUQKLKfBnHeqGX+TR2yaDM
         v2+4PQfkRwBQw5T85rNOkOOMqXIwua/PgowhkDSPcwVYNERaMqoa2rW8KLCBZ1fi6b68
         /wsY4lm8PfY+9LMImlIV3dbnFE4H5x9C5YxCY9MI494TL7wlTEMorN9d17TSOSfXOYS+
         Uo/Q==
X-Gm-Message-State: AOJu0Ywhqn5JOpMXl8w19vSgy0G7MTmNVYPg05h1+tejeENMLaQpBAHt
	wHAM139GhjFK5aAYyLs0mmxVpB0lglovS50OsCAWV19IFyaBJTcJ5tO3xprleO0qK41kqrwxhzJ
	NKydRABA4Jdh1ET5b9J9JT3+tzSMzE9ogfNNhtrBYeT5vufhrDGjoSdbzi2aOQc3b0kDU700=
X-Gm-Gg: ASbGncuzQo0ql0QHIaaXPt2mzo3qIM62EK1bgFrzTJJNVdiiqoVhhGiS33y4khlOrHC
	3N1tGIN0zlGrGU3FgEbQDZ0sCzHdgo8cTV9Fm4zn2efrZdrHcgmV9lPVCoCtlDhLPCne07ENk2g
	WhquHNYHttyJPDV/lAny22qvfp5e9AMznCkNnI4VvRUbY0Z5MKppbeZaj8wK2Avdev90i8auxuP
	NrgI1iBPPOSHNpGsZRfipF2mklBmfMhTMR0jqRYwyo1em6Aq9HwrcraAE8OlevfadyPWcZeNm23
	KX3LoSXjD1W3+DXlByrRJVGhUXNr3A0/vpoV7hNTwSky9TXUT7z8EAflSk9lvRBwMExF1HFczDr
	7/Isp
X-Received: by 2002:a05:6a20:914c:b0:32b:7220:8536 with SMTP id adf61e73a8af0-32da8138b18mr7044324637.16.1759955911372;
        Wed, 08 Oct 2025 13:38:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF55s0d4OKcGV4S0hdNYAnygzHTm8QgYcmxZanxkHpyxoPuMP89JFJYsrWn386yiKhbB/m2ew==
X-Received: by 2002:a05:6a20:914c:b0:32b:7220:8536 with SMTP id adf61e73a8af0-32da8138b18mr7044297637.16.1759955910864;
        Wed, 08 Oct 2025 13:38:30 -0700 (PDT)
Received: from [192.168.1.45] ([49.205.249.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794d4b3d4cfsm645439b3a.13.2025.10.08.13.38.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 13:38:30 -0700 (PDT)
Message-ID: <00280310-a655-4251-b3b8-a5ff26d0cd97@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 02:08:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
Subject: [GIT PULL] qcom: GPU firmwares for Kaanapali/QCS615/QCS8300
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX4IWYwQ6vb+x1
 5P0XUhfcjOQ2OKYvBDun9d5gnm3unc+AU6ePx+qcD4bVNlox0/M8wISrWFWS37sGqpBGXdc8r5R
 YufDS1LlicPlKmZM7Q0H9GjVPNPaNjPoalIP18tvn/z2cNifeyXexkLelEWev3t7s6DHqWKyMDU
 IAChyP2dw/hAqQNCiw8f6ln4AiL/Z49aBtACDduJ+PwRsOUgREkZ47D0feW9KBN20YGb/MDRQiA
 zYGztlub5OmUwIVs/pcDr5iB5ko/Tgkh43zgJxPP0Q3V21C4E/iS80ddECpsB+TEsQsRZLRlLU1
 pswOJ5aHlr9MmiebTvHaHIi3TEi2TQeqjyz2a+EH5/rxPsqwV6Wg0VhLMPG1uHfsScGhvrE1H++
 P5ALUVQeeoJfVLvcI9+inMhFttgesg==
X-Proofpoint-GUID: l6px0hTh5AGPNH1jZ09ugnDLcjZIXQnT
X-Proofpoint-ORIG-GUID: l6px0hTh5AGPNH1jZ09ugnDLcjZIXQnT
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e6cbc8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=GlrJpHMYgxXOMzboVQhm7Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=wUITrs9Ea3YrPtyr3P0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=fsdK_YakeE02zTmptMdW:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

Hi,

Please pull the gpu firmwares required for Qualcomm's Kaanapali chipset.
Also, updates for QCS615 and QCS8300 GPU firmwares.

-Rajesh

---
The following changes since commit 46a6999a2d14a5f2239e7e712e5bbcf543f59034:

   Merge branch 'robot/pr-0-1759560666' into 'main' (2025-10-04 21:36:21 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-oct-9

for you to fetch changes up to d387533db74fa60ee973007d6ba2455d9ae054bb:

   qcom: Add firmwares for Kaanapali GPU (2025-10-09 01:17:50 +0530)

----------------------------------------------------------------
Rajesh Kemisetti (3):
       qcom: Fix QCS615 chipset's GPU secure fw
       qcom: Update A623 GMU fw
       qcom: Add firmwares for Kaanapali GPU

  WHENCE                          |  10 +++++++++-
  qcom/a623_gmu.bin               | Bin 51544 -> 53516 bytes
  qcom/gen80200_aqe.fw            | Bin 0 -> 25880 bytes
  qcom/gen80200_gmu.bin           | Bin 0 -> 108518 bytes
  qcom/gen80200_sqe.fw            | Bin 0 -> 118100 bytes
  qcom/kaanapali/gen80200_zap.mbn | Bin 0 -> 12088 bytes
  qcom/qcs615/a612_zap.mbn        | Bin 2977 -> 14256 bytes
  7 files changed, 9 insertions(+), 1 deletion(-)
  create mode 100644 qcom/gen80200_aqe.fw
  create mode 100644 qcom/gen80200_gmu.bin
  create mode 100644 qcom/gen80200_sqe.fw
  create mode 100644 qcom/kaanapali/gen80200_zap.mbn


