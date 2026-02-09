Return-Path: <SRS0=LGkW=AN=oss.qualcomm.com=akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F40BE7E0DA
	for <linux-firmware@archiver.kernel.org>; Mon,  9 Feb 2026 19:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 624ADC16AAE; Mon,  9 Feb 2026 19:32:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63841C116C6
	for <linux-firmware@kernel.org>; Mon,  9 Feb 2026 19:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63841C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619Il8393347583
	for <linux-firmware@kernel.org>; Mon, 9 Feb 2026 19:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tbGV+CIOAB4dIW5q0FgYhP
	ub/JeYPu7S6gikxJk5RPc=; b=NiCiz+Mf1IAgyxAHvH2K0NcbpvGHGN1o10FiKl
	1CWwKig4UQ+yZTgJdTGztOV7f4s3KsMzVZlQS8rSOp7quao+sn1MrFoDJbqmjDmj
	2utvb7JyiIpIIYhTmXNkvB6tlLIQTzquhION/G4hnd52p0qiPboEAOywcjgy/1JE
	rhtaCk68nFWSdmXhnas0TRYIyTTJo5pDNWmn/gWNvn8qCuNpsGiN9ctoOAB7dH7v
	0uVzkelo5KIr2IaZioHx9he0b5FIrFumtP/x2B19PFmw/Ui/BxUyOxjFo2G7bfRS
	hIHD5eqWoi2+zqQ5eJC678NHxi0spTUHOg+JiVQI0oefzvJA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c79cy2r4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 09 Feb 2026 19:32:04 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f3ed6e935so6652685b3a.3
        for <linux-firmware@kernel.org>; Mon, 09 Feb 2026 11:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770665524; x=1771270324; darn=kernel.org;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbGV+CIOAB4dIW5q0FgYhPub/JeYPu7S6gikxJk5RPc=;
        b=HJAPirNnO4CE78uTWumpzb6pCdQFniR1EKUznuHYUrV5t9K7gV/9aR/343za2EONtd
         a9g9XEy7dQbK6RxQaUvgEn7e8sQHVruiLPNKRqVmzeRDUKrmVSZnfWL2/CTY50YCEFet
         Gzz/QfEDoMa/irxOPvZ9tRFKg82HADoJGguFmYx5PV1eRzGOaxFLwW/2SwDn0iBztKcA
         hVfV9Y58noNy2+K1WjoOXWiONh/CY9ivcqreAgDtL4yu6M6JFxxKBrFLPn+vt0zOiq9F
         U0+fNG9mqJ0zYHi05daFLJi1Ryq6PIzs2PnI734Cdvvtc2iHzaphGYpZqTyXsVIVo9Sz
         Qm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770665524; x=1771270324;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tbGV+CIOAB4dIW5q0FgYhPub/JeYPu7S6gikxJk5RPc=;
        b=q36AtPk95EdPXwWNYjd75sLda6q8W2XSoM+YpjommoRthFgq/BgdMtza+prRd8B12F
         MI2bIwIR9h9oCLTes/r0bAwKBf7ZmaXoGLiM4v+EkCHXHGXcnPnrUqsBe0+yh5bWW9a/
         bAMWBGpYO1qoDUdArvGF99wTv+wQokqjBV5yP4L3KxbLdIskPAupWSAEWLrFFHXFtL9r
         5ISDVHGvy86UcIhTMibLcm1UeGe217LNsr24N/1wOxd/VsWUWFm1GiriJYQ2ts/mLze2
         PsERj4DzIxesjDUI+TUc81XGhdg0xLFErKDAVi4tqeo2F21xFj/2ooJ8nitghkwdgPnR
         8esA==
X-Gm-Message-State: AOJu0YxT3n+3+eJF2lIrAmio4pmdD+P278erxME0Ddgzvy9oTa2EV5ch
	nw36wmCexSrgGQeD7DXCxiyPnzUmDB1NGIduAmcrNk5ZEs5zBf814VVSkEQ8wXJBnMemhsYBez1
	Z0Ys0Ff2GLEfaxXxgVnpJKVZGkpDuVcFCgB++59tuyCydHCmmQKnINWYTWyRHzis3f5plSjM=
X-Gm-Gg: AZuq6aII109e3hLOi9VDVPro3H+OAtr7MwziiKQoqMqawF8V2ETM0m3EgqCHYii4HgB
	PeDT2/v6HUuSbAe/PELYdgMk0OYsdGCNoWwfEpuOkvTbTw6MqQKfwL5hlM+FCqFCvGzqniX0Nxv
	ZISjvY8GDUxleFAhfSHFgWISDPWBx2qnFmW90EAZm0l3Qe8HY1Hxb2Dv6mbsxJDKBaR4EEZYJc0
	A9IWgYcOYmOiUkE9rgg+ph5SNNnqGqGpwdjhO+LUAmRldK2Kyjlcq1icIxKMjahacnreqVAkxVG
	YVfTSvD28QkjcmX++5X4Ods1VyrcfMltYtSfcSynQdsBxK6MlJHRSgXTolBPINUotPvp4csh++8
	+t7J5bXeW2Fkmzw5KSo00b4A1w5W7Xn4maQ==
X-Received: by 2002:a05:6a00:2e1d:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-824416f88ddmr9138484b3a.43.1770665523682;
        Mon, 09 Feb 2026 11:32:03 -0800 (PST)
X-Received: by 2002:a05:6a00:2e1d:b0:81f:52d4:a5ec with SMTP id d2e1a72fcca58-824416f88ddmr9138467b3a.43.1770665523197;
        Mon, 09 Feb 2026 11:32:03 -0800 (PST)
Received: from [192.168.1.4] ([106.222.233.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6dcb61e4a1sm9580363a12.27.2026.02.09.11.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 11:32:02 -0800 (PST)
Message-ID: <c35c5b10-3065-415f-9ce7-8749297d5207@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 01:01:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
Subject: qcom: Add GPU firmwares for Glymur chipset
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RLH-OVQKOerhFK7whAmShgHuaLv7ucza
X-Proofpoint-GUID: RLH-OVQKOerhFK7whAmShgHuaLv7ucza
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDE2NSBTYWx0ZWRfX+os55EAkD/jL
 Dy3pgVPybaZlZnjLAouo1i9Mfss7hjPU09mh8xC4YvBDrBi1SqquQcNMzvetNlpT0W1yA/Xf/wc
 QcHe2rOtl1GlrlWmunaapN8l3CbGBG4UZYJ0OonZPjPoaB9cA+XLlyYrnpJu9B7RU1lbGe3a9Un
 E/w77nbwyPbTCD0LbORdN7nfUVnicF3DmqegMLVykdVGrNv6rWcAEZNkl4ZopCmn3/5nf5NiUO1
 B/JVuy2urqucPlACYUPwEEPEtBpJlTNA086xxbBbUYU11yTJNWwr8R1LWoiVakNFRd7gcIGuuZP
 2eXOs4rOyygwNR+ihmp6XXTAWp7P9pKPTZOKBcq5t6n8IEMjF+Awvv5WbfTrKuChBhh81uyonSr
 M5u98g4ZfmbRSHQJx90vr0Jlg+Ez/tWeozCrhAuzXc7tpaSCqoo137Ftgtt8PPUG8QneXExv5GM
 9ThQn26zy+LCslGwGxg==
X-Authority-Analysis: v=2.4 cv=EtvfbCcA c=1 sm=1 tr=0 ts=698a3634 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Pj3+RSVre7clEwCZ5l1bbQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=nYbhBc0gwFqqtUAoTRAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090165

Hi,                                                                 
                                                                    
Add the gpu firmwares required for Qualcomm's Glymur chipset.
                                                                    
-Akhil                                                              
                                                                    
---
The following changes since commit 9ccffb6087334549bdb115e4b605f7bf8a0dbae4:

  Merge branch 'amd-staging' into 'main' (2026-02-07 05:25:49 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-glymur

for you to fetch changes up to 0364daaa28a266252de482995109d7baff1959e8:

  qcom: Add gpu firmwares for Glymur chipset (2026-02-09 16:45:26 +0530)

----------------------------------------------------------------
Akhil P Oommen (1):
      qcom: Add gpu firmwares for Glymur chipset

 WHENCE                       |   8 ++++++++
 qcom/gen80100_aqe.fw         | Bin 0 -> 31940 bytes
 qcom/gen80100_gmu.bin        | Bin 0 -> 117596 bytes
 qcom/gen80100_sqe.fw         | Bin 0 -> 119828 bytes
 qcom/glymur/gen80100_zap.mbn | Bin 0 -> 12088 bytes
 5 files changed, 8 insertions(+)
 create mode 100644 qcom/gen80100_aqe.fw
 create mode 100644 qcom/gen80100_gmu.bin
 create mode 100644 qcom/gen80100_sqe.fw
 create mode 100644 qcom/glymur/gen80100_zap.mbn
