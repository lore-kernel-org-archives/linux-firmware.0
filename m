Return-Path: <SRS0=gmQ4=YH=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C26C54ED0
	for <linux-firmware@archiver.kernel.org>; Fri, 23 May 2025 17:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA122C4CEE9; Fri, 23 May 2025 17:08:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C69B1C4CEEF
	for <linux-firmware@kernel.org>; Fri, 23 May 2025 17:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C69B1C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NE8IKc027636
	for <linux-firmware@kernel.org>; Fri, 23 May 2025 17:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tZUadBFHdEtu6nVasWJSp0
	TAppzK35LzVtrVbC8Wug8=; b=VIsc9/hahModkP8X3PA1B8iC7GVr0M99R3IrGE
	aXOMtHoA+grJu4k3WXH+JuWtnc7F9fefFanwa6ufBzaL+31aP6GpUT4eTozFo5DS
	+uP/sPxDGnjFpdOhZajBfhanvUa1jy6YDpHtixdCXg0YASFpmfyLd9GhoWHqS4Ps
	9dIAJmh+pAOitJfq6Ga0yKPJHbo6QjdRxaVjLt6yKvymZXiolw382/psU+TPAEbD
	7ObJeHHx24IO0UAmz7b6jQDX+AL18ucjLChTa5ja+5XwGW+SkFCmVcaktjKh/ouo
	ggtOOWkfZxkyf2HAI2he2QxssLXXfZbxf2xizW+CGaf2hA4A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9jj2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 23 May 2025 17:08:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742aa6581caso99598b3a.3
        for <linux-firmware@kernel.org>; Fri, 23 May 2025 10:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020084; x=1748624884;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZUadBFHdEtu6nVasWJSp0TAppzK35LzVtrVbC8Wug8=;
        b=iv9acN577H4l1xXlL1We6r5/SKTW5iFsqG1cfyh3BCeW21PngNBe4MXBSE8mWENGLe
         AF+xg4NJLoJ1BbTjjMAeJ2S6I2LdTYvPvJG7n3OoJMYhUi4QfVYegKDJGtwwJ9lLawXL
         FI+MaIw7g0cM1aamOg+m4MQbI16QWu6++MmQUDqVYvoIGHbGUSmgj2qWHla+lVeouu7d
         jp5T1E2zjYJefWFD91JWZOOspNN27hB1zYyFJkyU6NkTeh/H72xol8sJ8oTmxZchpLjZ
         MBS5jU1rVQnslkMEyw+bwZZp0FRA+e/+dDdXascsSfiRmNpMq/dwS/zgKVHhAGS5bOyk
         7YEw==
X-Gm-Message-State: AOJu0YwPTfPy5YBi4GzWROOm0nonVmLr+wCBUofTaDzANFjRKG3Fnu+z
	ipQI8IEMYz1hrFt038NV13DFFsC3MmhsYI4MFpOLDybfGxyGdJ8qGy4xMfHsg1Tr5ZKLS74icKg
	Pg39Hl+KAtbtT/rlhBeWnIqpZD4jHmqvo2rTD7Svg2MXWekWXVe2ZepqO64yCzNgyD3xvx3M=
X-Gm-Gg: ASbGncu6VdXHtvYIhb8KFKkebTPKMloZeFiTEou72tDmhEqzlAjs+1ncYlBxjo1iUs7
	bx5H+r7xS6Nh0at1HoPrEPjT1NmA2taK1G+yFqpsFJbwUa6WtdZZ+t0TCSk8YqKhci9Ee2YGBxJ
	S/654CNfMcRSJva61x5pBRhgqEwfRhc4/84bl+nq9WN6bXegIax63IypvLKrBqI/0i9KLSCm8kT
	PeybGOcweKE3mucTSyytMS6DI/H4lZuZ21nXd3sGERR65gSqX7m3ZTziRWZF0NiEbJ+8y1tQPWQ
	0Y7tbVhfSXm4vNkPZbe6SN2GJQ4U22McesdGBTmybjCVoPdi
X-Received: by 2002:a05:6a00:10d2:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-745fe03c2damr380010b3a.20.1748020083890;
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5x+zjlejQD7iUhgZen4iAhbFV5wkG6YLj4vbg91n7MooaF52e912rywgPZgF74Hdf6hPSIA==
X-Received: by 2002:a05:6a00:10d2:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-745fe03c2damr379983b3a.20.1748020083500;
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829c37sm13084080b3a.117.2025.05.23.10.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 10:08:03 -0700 (PDT)
Message-ID: <fcfa4e63-e421-42d1-b6da-11d2d7d2dd95@oss.qualcomm.com>
Date: Fri, 23 May 2025 10:07:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20250523
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5D7wkcNHNnvlYqT7HdMW26w3ffl4vYIw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1NiBTYWx0ZWRfX170sHsgYoDCN
 8TAJAxj9IZxRNzaxdsLQVVp4AfMhj0gMDtCxQfEKxVpJP0/ZuJfdqSLJw3S0pIdZ05KF6kUU/DM
 szdc04kflkwtwVki67hOPs5P57YtTbRXsK1hkOWc2FdEYL7QwGNVOjCjj5W6AIoVH0+nb15kgeZ
 BCWfjWlYtMe5PVhyhJmSinXixriagHB+gkYO4MWRQiQuaFGJnGXvKgjU8PhSgfTFx/P1obJU9a+
 OKv9QeRLwSQH79sJp2Fguzm+E+I0Y1nzHDek//s9Ro2yKns/+2WfhvCQos8S669s5RFnNkAdD3H
 ga3Eq1cXACLzfVFZhGz3cZ6mbRcDwKFjcq1Twv2hDwKAebVDXaMx6ojiYmN6WaOZkgHNfB+cREF
 NK8W0WbyF4wws9sDgaeZy7S/n5qT7jE8zvUppV3I9pS4lKUNYOX1aKcQGJmawM9TdFvti+k6
X-Authority-Analysis: v=2.4 cv=GawXnRXL c=1 sm=1 tr=0 ts=6830ab75 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=w00LdxtAzVfKRbiaHPIA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 5D7wkcNHNnvlYqT7HdMW26w3ffl4vYIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=869 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230156

The following changes since commit 3fbaee2775a4a6d44021aa035823a7388b0874fa:

  Merge branch 'robot/pr-0-1747839277' into 'main' (2025-05-21 15:05:37 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250523

for you to fetch changes up to 2e91d8c3c4bd34a27177180a38f62d3ba3c96031:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 (2025-05-23 09:50:02 -0700)

----------------------------------------------------------------

This is an update to the WCN7850 firmware that fixes the widely reported
failures due to the prior version in ath-20250424.

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

 WHENCE                        |   2 +-
 ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6078528 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
