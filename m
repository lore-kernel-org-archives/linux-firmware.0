Return-Path: <SRS0=PHxo=7N=oss.qualcomm.com=vivek.sahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338FECF6A88
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Jan 2026 09:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09E72C16AAE; Thu,  8 Jan 2026 09:03:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33863C116C6
	for <linux-firmware@kernel.org>; Thu,  8 Jan 2026 09:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33863C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6087QY2K1259090
	for <linux-firmware@kernel.org>; Thu, 8 Jan 2026 09:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PM3heGAwhOqA8flPDdnPpL
	/VyNnH0kJ1IGOTxyiBv58=; b=AVqCCQWaqTJT6tS16sZVhZO3Vc6bd+5DcMKfk3
	6QUH0tG9I00fS9zl+vgj+8HAxxieQqx61Lm0YeILQWfD0SL9dCJWDEvNYX2hr8ht
	PjBcJQQT/PstH49vLc3ffOYqNUP1iXrwv5MqkGMjtbhei48bStVOutIdo3SRWPLa
	DA4bcyC9SZADAdIepSB8eXRZlef6j3GxJ4tyv4NFQ3eROxBHhhANJ2Oo7kg08vgp
	ibdPALv+GW6hUu/c7BwAR6UXZnINyRcPTlMHI/Ho2200yN45TxRsC4CoN1AJ4dHl
	/A7D7LrmRC2hsFrXSLWS1V4t36p4SbL1qlb6vHyuqT92TtFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj86gr99b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 09:03:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso55685565ad.0
        for <linux-firmware@kernel.org>; Thu, 08 Jan 2026 01:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767863006; x=1768467806; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PM3heGAwhOqA8flPDdnPpL/VyNnH0kJ1IGOTxyiBv58=;
        b=GlySPiJ7peBOukj2dqfwfMz04KYXgNDlXASs0hJD9fmhuahGvyDLNPhb4As9g7PcdN
         JNBDathLTdkDBu39SCmBbC57udlc4W0dgv1HJKG8nwif72eFuiev4QlUvBpOg2ac5Dxz
         pFENuXcaPqPlwlrVe7/YD1joc5EHEo9nfl6pW41Yd+/zNmWrjV10rtionYQb3QOCJH/t
         mzw/zAE4UoYJxCbFrgzkiqMK6tLuLGF5x+iPi3H4yHU9C5uCZNEgnm7Q67g9PKJ8btL4
         H8oOI+7X0ztlCK5Crox0F+UDR8OKEHzhspLa/gxIIAPtWnOoDmUXYBLYKyxuh+rHovPr
         1jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767863006; x=1768467806;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PM3heGAwhOqA8flPDdnPpL/VyNnH0kJ1IGOTxyiBv58=;
        b=J75f7x2fi0/RVGCOmjG3jgOL8m0an2aDWiV0cDlC2QMH54yTg/EY73DJ+XG6A9goEJ
         c2CS9KSivYjK8US2aMFC7cwkT71iTjBekLJ2M45eSzbqVDvPyIZ/T7pvq9PUwhzIPu12
         Yf0CpWuMPk4y4Y9G1Mod6HUZTGVgVIS/M2lKEZqjc4CS859M9+nEpQVL5H95jDbEBXu2
         J59RUEExEI/8aeasUDnxLk8IrSfpXI0eevuny8TEvN0vJlSVknc8qcsFwNb6Er4aFhb2
         3/yR+p93GluFmksyDMd+etYSaIqN0gtIdelvZQLpSUxHH91av9ipnaQFjcc9vq0Wp3hD
         jYnw==
X-Gm-Message-State: AOJu0YzyD3VySGEdNS1FdNTeTU/mKe1SHUMB22fLCREUI6BGBiuckzcq
	r8DELyNTxvuCiKtJB9JjJCieRuBJOut+1c9/fovSF2uKhHja9FDSS7Cl2W9rf/9zdmWOw9BSXMR
	E8VSIx2d+bkm1WAOIe4BAAEybAC4iPolCOIq4tmH/dVHUZoMqohvqR4s+PKodUAXwliSbQW8=
X-Gm-Gg: AY/fxX68yMfQWd3QYRYjp3VmJIBV4wTD8HoXvqBhlilbjgW/b3k4OJow/LFy/DEcjFE
	blIyd83p2qG3rGUzDp9OAMtBd8FsILzGAR45feFIZUuDCN23/vZIGVUHXUR3n6uDMnA0RUwyhbB
	HvPcyHBfAHWIlLBv7Wpd/spnazEMusFg+tQR7eIU3NzKNfCbUJCyO2RGQsk4JS7FfqgBoXQFxYH
	/wpSuQej3vcsvhL9XIaMZZElC4klgY69KEzFZ6EDm0HK/fsSJNpbLYZJ4RZ3mgM2VNAVKMKUtze
	EiG9f+6sORydPsAa1unYFg1s8riWjifEf0dlSpU1oJWLZOrDsljcbcVgXqh+AoY2n5rjPoJnOlK
	1nGFcVBIUV16aHFPmVyJt2oqjFjRCHwHfjpd5
X-Received: by 2002:a17:903:3d0b:b0:2a0:d527:4d08 with SMTP id d9443c01a7336-2a3ee49e03cmr51677215ad.41.1767863006368;
        Thu, 08 Jan 2026 01:03:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAf4ftChb0ghoF2bmkGPR2FyPMbIoMfsuVv25lfcB316DTdEOrt0qPh9h6db6PKtYkqvHyww==
X-Received: by 2002:a17:903:3d0b:b0:2a0:d527:4d08 with SMTP id d9443c01a7336-2a3ee49e03cmr51676865ad.41.1767863005898;
        Thu, 08 Jan 2026 01:03:25 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2eabsm70971725ad.49.2026.01.08.01.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:03:25 -0800 (PST)
Message-ID: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 14:33:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        quic_janathot@quicinc.com
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Subject: QCA: Add Bluetooth firmware for QCC2072 uart interface
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZNjaWH7b c=1 sm=1 tr=0 ts=695f72e0 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=OnTeq3a1JdpWYeJxUEIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: p_SeJQhUrd7FBDwGb9VXLGVSYJ5Qwo3u
X-Proofpoint-GUID: p_SeJQhUrd7FBDwGb9VXLGVSYJ5Qwo3u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX0SFRVnX9wgZa
 sD+9oRnlXOIShFH54KCGQWnmvhcCitWU8Xd7uWsFcE6GkiLfMc+5tNZGboHHKTVvDazo4qXSiDQ
 lkf0lXYTh2MD77Kix5/X7kZDlUphkqImYqcLuAvTDulHfvZ0i0tge6YTV6vMUaohz5OykAe5A/I
 C+oHSg4kBzgNYrNFlic7AyGUOvwgQVjWvWTZ6Pejt6/EtO1iTjVTIYRlJE9hVRE+js4/XFAvKpa
 IiZBCub+X8jTwQ0zb/yulWAF6vIn+laR1/zKa9nG1/59J3fuwDov5pICm17ReLl57POHY4M8yZh
 sFHzj1SMMJT0BWnGxVDRWFjZKDqmzks2JJW+qXX1miVSoFZ3KvDcbiW/RhGHJ7/M0wZRxJn2axg
 YgTDOKmERHS3pu1lC3bA5FE8gFFGTCBPj7SnIUlxynYUsSNPxKnLVKPHL3Au6jk3/RWel1ublOW
 aCs40yeb4vvBYLaJo8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1011 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know 
if you have any problems.


The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:

   Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06 
+0000)

are available in the Git repository at:

   https://github.com/vivesahu-huboss/Cologne_FW_Upstream.git HEAD

for you to fetch changes up to 5fce4edd5a84b09c670918cfcaa0705eaf1c2b60:

   QCA: Add Bluetooth firmware for QCC2072 uart interface This commit 
will add required Bluetooth firmware files for QCC2072 uart interface. 
(2026-01-08 13:20:45 +0530)

----------------------------------------------------------------
Vivek Kumar Sahu (1):
       QCA: Add Bluetooth firmware for QCC2072 uart interface This 
commit will add required Bluetooth firmware files for QCC2072 uart 
interface.

  WHENCE            |  10 ++++++++++
  qca/ornbtfw11.tlv | Bin 0 -> 216274 bytes
  qca/ornnv11.bin   | Bin 0 -> 10880 bytes
  3 files changed, 10 insertions(+)
  create mode 100644 qca/ornbtfw11.tlv
  create mode 100644 qca/ornnv11.bin

