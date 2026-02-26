Return-Path: <SRS0=gwlK=A6=oss.qualcomm.com=janaki.thota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E064CFC5910
	for <linux-firmware@archiver.kernel.org>; Thu, 26 Feb 2026 10:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6F3EC19423; Thu, 26 Feb 2026 10:14:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF32FC19422
	for <linux-firmware@kernel.org>; Thu, 26 Feb 2026 10:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF32FC19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4UtQL3225947
	for <linux-firmware@kernel.org>; Thu, 26 Feb 2026 10:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=440rR+vjhhvAuO1M/3rpHM
	wbUx1gPBqP6xks7JOKcBU=; b=nf5CiXeVlAIc6PjmmoXn+ftg3YZ3jWoLCg7/BS
	EmfZ3yb1dsLUHSSoZfLDJulwLbgi60QDaIbgBlt/xfhnFB0YDQ9kcb92YyR4+ZD2
	QBDRX2z4SFrqmAcaUzyU6QJZg2cFEl2KSHvTHFCiRqIk11qMB0rju8xIjx2tAG/+
	ML0iMExEob4jUdFg6x6rOS2gJ8ZyIq11p3jVyKOWMWR1QuUbH/80FaAiL5zr44vM
	sXXjqIVQNm/xwfF653cto4tcrxdB/r9F6QSISuldKdXDOEM2llH5+nsSZ99tTK8f
	+z40X+UiNgf1Y4riBon2b+jGt4s/7OXm73IG6jJUhFh0bO8Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjdph18xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 26 Feb 2026 10:14:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a90510a6d1so5854425ad.0
        for <linux-firmware@kernel.org>; Thu, 26 Feb 2026 02:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772100845; x=1772705645; darn=kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=440rR+vjhhvAuO1M/3rpHMwbUx1gPBqP6xks7JOKcBU=;
        b=HS7ub7hoXY2qGCLvcRQd0tPiXuxVGWKCBTp3S2wWpjTVZgJwxzJar4DF7vrRdrmxGz
         r8aDs5zufS8qRgDLoUGgVMZRjWj0dsr9KoI2qU51l6m+NTvHR8ZcYaC7XdanZFN0Kkur
         gqGu2HpS5zC8KfWosabpwy1h2GV+NAx3yMXDjdlqpca85cMg5sCCH37GHGXTFORauB5w
         vnP6d3dxSa/ryXqiwgo6ids0UqHFyNxbxpGg+HmfEFSY3sFVrFIlWBDxxJI8GvdIMi0j
         Atj/4xmXkmk5N7FyNMzC88JEClwR3BS9P5UOiSGTBAj+QYx237Pg4mpJnrZcvwpx4xbm
         OjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100845; x=1772705645;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=440rR+vjhhvAuO1M/3rpHMwbUx1gPBqP6xks7JOKcBU=;
        b=EZRJ3PEWBJpvOnyDHekuLD215T73xMU+8UDS9sgJ6NCcciL0xEsCO+dqTc5iSyGAao
         oo5Et8FKT+U+h/JOR1oTEteYJRaD4zrPuGw7AppJjDSG6UENyl51XTHmTHyF6olNJ6Zz
         v+vpYl34B737Sa28vErYd6SqG7naJs0HToyq+2+YYxjZjfvLaTVBWN8dceAtEYuca0US
         h1ucfKc/zTvUgZz52PaUbdHcrK+CqJSYZMZfaICszybQuUcSoaOUkX2aWUGDaWvnUsyQ
         E1uu2s3zgImxGjiWF7BbU42h2WT/fH+BneME66qB0leA6O3KQQv3yqgCc2zyKdzN7Ty6
         XnMQ==
X-Gm-Message-State: AOJu0Yx+qu3Adue3t8EIFcgIRtovg2fT3auvaq/TJqhhYWnYmBLXwgel
	41Vd98RN15skZ0uCVmGCgqxkNZ94NGYedI1OByIRITCFyHvjo9Jtb5aG5LjaKdiOE8cHz3HBWNN
	pzFtx5yU36uriIyedQUHJiNnVml+h2RB2lx2D9vLXuDBDJNVNt2WaIvGkCVPLBwWlEoInSBc=
X-Gm-Gg: ATEYQzzAaHz59wI7qQqu5HdW7GM8QYLnl+mBWpwaFo8Xh06my6Fs1AhfbCesEvNuVni
	zKfbAVkgfTbDRT39QNM7JVzlueuHp+v3+uRrH1Up/phsDA3AA8Op5eQmpjFtbqQYD3jitranak2
	drm6SEpSOG+TuaeqUPKLy5BPwM6WAsvmMkNxOXRCQb35EtwFjhz28+Zj6ePF1gHQXUOIgUdsLtm
	G1X+vRbQeq1zuhT3ryT51NfMcM/LH/cCdDXTuFj0ayeFUS4ZNxDj6JLj2R2fLy0IyZKV1aEVSxx
	1szNus9l1QXQfUqOTvUH2rAC/MP+hza8kBdH6OD5KnsKYu0SschSJiAsLLvXFK8Cf8wTmuSHiGj
	2rIrEzqErixCRdRJuMSlZAQPDHNx8VkNXyEdHMb327YDlUtOKiA==
X-Received: by 2002:a17:902:c410:b0:2a7:a1f3:f327 with SMTP id d9443c01a7336-2adf799e474mr21043345ad.20.1772100845492;
        Thu, 26 Feb 2026 02:14:05 -0800 (PST)
X-Received: by 2002:a17:902:c410:b0:2a7:a1f3:f327 with SMTP id d9443c01a7336-2adf799e474mr21043155ad.20.1772100844976;
        Thu, 26 Feb 2026 02:14:04 -0800 (PST)
Received: from [10.219.1.107] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b2296sm21416765ad.5.2026.02.26.02.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 02:14:04 -0800 (PST)
Message-ID: <82427fde-147d-4a4d-afed-a6d9e250cae8@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 15:43:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>
Subject: [GIT PULL] QCA: Update Bluetooth firmware's WCN6856 2.1.0-00665 and
 WCN6750 1.1.3-00106
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        hbandi@qti.qualcomm.com, mohamull@qti.qualcomm.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O8ftbTwxvcQS7BBxGG2jQ94ZXwV9tIFL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA5MSBTYWx0ZWRfXyzMiXW09md4t
 t1Xof96M/E6QdzKzid2gl0VdkAtGy+Og00nctXOiHXnhl8Th4cmHDPsuRBqC+LJX8iFpjiwVkFa
 HK0N5AsO58rLEuMv4WDCNBkYH3f28IlmiZzK3ejcjJi4gjPtyvSDnDQ9hQF+AjonSKajb060gl5
 U4KX2Xe2v4E2s7JgNHRapZ/L/GgVr3XO3gejn7CYzWF48pWv3jPG7AXmQr8i+qHpfkzKgXxHllG
 vJnqJGnjZoarOkr3+5L8gYt7UnVbwDpGsVxEcKce7UFZU5ectkFwxvIkDrYd+C1TFueWxSXxAz2
 N0hlFla/zp8Oq0Cp1BpN7fZGvPRLQTLkRl6cpBAftaE2quMzd2D7GSMaoY7eb1M6cLXoY4jNAxI
 E6UaH15UpMpfCTLC/39x8xDZmMsAqTYvCej+LTLfYrVgyyOY1joHXjkcuh6RhAJ19eT4VmZMUG/
 DgwUy7RFrqDxApIx1Yw==
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=69a01cee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NEAV23lmAAAA:8 a=o10hcOGFqp7isJWLOgcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: O8ftbTwxvcQS7BBxGG2jQ94ZXwV9tIFL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260091

Hi linux-firmware maintainers,

  Here's a pull request for bluetooth firmware. Please let me know if
  you have any problems.

  The following changes since commit 
1db833e68de88cd3f7f6612a5552b3e671e36ef0:

   Merge branch 'remove-obsolete-lenovo-fw' into 'main' (2026-02-21 
15:51:25 +0000)

   are available in the Git repository at:

   https://github.com/quicjathot/bt_hsp_fw_2.1.0_00665.git HEAD

   for you to fetch changes up to c12f408deb767416bbfb17d11b0cffdf23f07c1c:

   qca: Update Bluetooth WCN6750 1.1.3-00105 firmware to 1.1.3-00106 
(2026-02-24 17:10:47 +0530)

   ----------------------------------------------------------------
   Janaki Ramaiah Thota (2):
         QCA: Update Bluetooth WCN6856 firmware 2.1.0-00659 to 2.1.0-00665
         qca: Update Bluetooth WCN6750 1.1.3-00105 firmware to 1.1.3-00106

Thanks,
Janakiramaiah Thota
