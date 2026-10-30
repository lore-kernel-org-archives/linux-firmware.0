Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EEF606A31C
	for <linux-firmware@archiver.kernel.org>; Fri, 30 Oct 2026 15:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nHuuh9HF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUw64wT/
Received: by smtp.kernel.org (Postfix)
	id 1C9701F00A16; Fri, 30 Oct 2026 15:21:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793373709;
	b=aS/oq3j0AsT37+Sd7jqZVh/ch6H/OiILr5oYQ40meSb23Tc6YmdFhr93ig0TCabVbOFB
	 nT7mGvdG2+AesFgrHCbJb8tRTAmSsh15VDHFc5hmKm0mBLpXrP/8D5KFyhsveVrDyqslh
	 NAgTwf2v7h2fWNJgmTh9Fk/ty4YoocI+uj5c17AEIbM8n8CQIqHT1XclwkfdoaQtkAa9y
	 383zTNbNYGQFq5/6I0q3WD4dx9t7aTl6UImcM1jhUECXQrp7LSnlPpbv/EvdDoVTZd65E
	 RN+EsEJy9mfGwsC86uVFa56Ugrdw7zGgOWg+P3QyhurY8TMsoYNLLsRgYI/ZtNdZ5kQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793373709;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sAULQRVnF5facmSRXEx8W6ksib0roSTKYLXWqipFzIg=;
	b=wW4Yayk3OmKDgUagYUOYjwFrabYwLcvXZRRcd1ao+Pp2L/PEDBVl0GeqFS1ufb+2anoS
	 e6LPvU+zMeUEJWwyt3C84wiGg3ciHytntNVH3f+cCnN8Fijk0c1RK3+gJCQ3qNzIUiv10
	 KXN7IywVe5nE6+REsLjQWBTPP5xbKhsFYJyHsJcRT1tX7vt+rHpi53rdUOg6ZhCgMeMG8
	 ZVZPaJSCDc9u05JFn6WCM4qxL7RBpG8+d/6BQCHilPRI6EOvxrjZfqKr3tYFOxA+y3kI5
	 BSu53mZw0mfW4Jkz/p6k4IiiTGi9Uo6Q5v/8zR5cNvAygSYOxu8/2GCT+rJ//3ob7nQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nHuuh9HF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MUw64wT/";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72CD21F00A02
	for <linux-firmware@kernel.org>; Fri, 30 Oct 2026 15:21:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nHuuh9HF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MUw64wT/
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 72CD21F00A02
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER8Qp3552208
	for <linux-firmware@kernel.org>; Fri, 30 Oct 2026 15:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sAULQRVnF5facmSRXEx8W6
	ksib0roSTKYLXWqipFzIg=; b=nHuuh9HFhLxMhwHt4xA8chCA70DCE/32ugMEm3
	eaUWtWiNkMveqs/Cg+hbRSfni2r+o6TadpI5WM+ZhtOjq+WUaZQuOG/0milJaXmm
	saW4g+gM97op/5RjobqAHxeoFqNs6Ga6Dz+CntC98ihAVrtaIHBeXDcZxa3Pufq7
	NGd9veSKkgrRMqUCYdoUqFhNEQP6CRSofK5vdCx2Pka4NnQqwdHwcUF3rpOSa/8j
	EivXRYoKl54oViKKMVVdot9FKPRfFMmjN4PKFGnPN+BEhAdXi5jvmmEpFurCwyEn
	kB6HKF/ED6ihac+MWrUPv474hveSowFZzdUkryWuomFz6AKg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qknrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 30 Oct 2026 15:21:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd6969473a4so572189a12.0
        for <linux-firmware@kernel.org>; Fri, 30 Oct 2026 08:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373706; x=1793978506; darn=kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sAULQRVnF5facmSRXEx8W6ksib0roSTKYLXWqipFzIg=;
        b=MUw64wT/uCvIOH/EWASUHvLWrKm6E5yw95C9m4UhNNUd41ZskIarXNjMmdSqMyLp6+
         wWeeALANeb+NqLvglLSuAD0FrDxU3KGkz0OnzQMUSmFjmBx4C8/5bJ1Sn9vNKFVheY7K
         j5dtZLf3BIfKE4f9MukJUUZ/uIXAgz47Jkr5nvTZUslG1aZYCuKNQuDMWmOrinGJQmPP
         f9UXNWuDyPUk8YsG+M5niPj3QK+LlVNxsLsar9/O4y5fakuV2amXmIk9BS8nIHCTzS13
         zmVWOGzuATZUElW7mvatHxVT+IdV10XKkEn1sjCU6hFKnMABEqNt8Py0D/4dZER9o2UZ
         BXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373706; x=1793978506;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAULQRVnF5facmSRXEx8W6ksib0roSTKYLXWqipFzIg=;
        b=PPArcUchJM1Kr+qN/+9MjNB+eym5TQMUy8xfdEkLm9NVmgqKeQH7G9WPAu9sm9tarz
         0owOp5kaDJ5pyWiLtPRrHVgtWeVbMXCN+ZdhmxdAmlHj9/PHLP5rKad05sHZUd5+6tGb
         hMItwb1v7cXP77Qajo7aGaPwDyQYGb0Vq9BG871IMV654m+Qs/xEimrTqTnUiDss+IZ7
         oSC+1YpBpL8lEgk4GdNLvUDaHBbFKvZ8bubsFVS6lXsoSpEaG+BQQMPG9kKPK9qW0hBi
         Vq6aiyMnQl44y++L5NscAdS0/lm16+JqY19Uoul45jkhnVN4Kb4ITbRxjI7E3U/mj9qU
         Dkjw==
X-Gm-Message-State: AFq9FYIOW9o60MUg8e8vmdZjUCDYYcTkgTkVbSl/bmlbyRLt0NowmuW0
	VRox3H7KNoXKNo0BvoziBK2kYHIOi4+A+7nNLa1C6nkpm6wxblrYLKufdPEa/8Spyc6wJ9Sb1sA
	j8br7AL7ZK0G4F86lFsysDCk0oWx+4iQSFOBLnYwCsTPRq2LBZjQN20HnzpVa81OfE61v4c8=
X-Gm-Gg: AYBFou3RE+MgwUCPwhNlYJMJYJJK/YhoilqiPolPAVijpaNifLOwjeayCdO+wxKSM04
	o5tICK4+leCucum6WWTp0rcxJV7tTG2boO/XQocsmFfzTrdbRRY9M1BR5sKxVxbRsodHNXrQfOH
	A8hf4+KfaEGridLOKkEb3F1zdYyhSKJGz2e2M4UUhYb3ksVN03OfgtTy4daXMiLTLK/fliWJGcv
	AH325/ASqwZAt+pIk6/3LFo3TEHVVRJs+cj4TP9a7NqYUDBpEA6Wra+EzXFEBsp6a6v1veO9R3m
	SMMX/q1+q7nzhSlboRdE9vtadg13bAwwofaPXxTqjlYxJ3N1AkDPQFWsD1GzyXg1jmUpkoieuJ2
	Qa5XDef+ShPMFcK1OA3IvAz99vuC5qYbX7moCQiSYnBkhU0y/5xjx7+isu1XCYGo+Pahg3g0wsK
	XsEvuMj+g7
X-Received: by 2002:a17:902:e94f:b0:2e9:5eee:e07c with SMTP id d9443c01a7336-2eb36396abamr26900225ad.6.1793373706201;
        Fri, 30 Oct 2026 08:21:46 -0700 (PDT)
X-Received: by 2002:a17:902:e94f:b0:2e9:5eee:e07c with SMTP id d9443c01a7336-2eb36396abamr26900015ad.6.1793373705552;
        Fri, 30 Oct 2026 08:21:45 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm8905895ad.62.2026.10.30.08.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:21:44 -0700 (PDT)
Message-ID: <1ea7911c-9dc0-4bb5-85b1-9fd7f72c30af@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 08:21:43 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261029
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q4lJaAazxebXhSXii0tzHKPoJSuJKrcd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX0pdXpqb92Ygq
 wIXRS4+L3HB63ZjZgJScEQS4M0RMv4DEps2a8QXtONNYviS6+JVjVjsty1xOAwnrbQHYuZERZsM
 WGIlMrQqSD4eOQoK8XyuxqLd/1jaNs0=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae4b60b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=qW8f3ulzRhYlp-s60KwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: q4lJaAazxebXhSXii0tzHKPoJSuJKrcd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX8F11epC10R2r
 MkMc7Cc22ChwBrdPQuteBMR8qW1eoJAH7pzbW1Xmvx0hspOZfQr1cfuFrVHlOQgot16K89zGA28
 +Ct/vKoVsVCA3yEQ5yg1Wx3E31F6N2crteLzVp81yr3rdp2A9AofsAhKNOVBDifNZTX7x3CM4wI
 eY0uctGZkM+bVKeNtqtxuuzGo6IPtQB2MK+SvMTjz1qxUSmAxsRTHf8wzyt5PKHf93OLGFpqTCZ
 dsicFwpLyxIp+bA2Jmqq0dfqinJfKhJAMMQb71QdUKC2DXKsdGFvHZ0Wu+TUwgbY6QuK28d3hok
 PTUw/ORDlfAzGkc2OZTVOguSst0tuqJtmKBjTSxKDoN1AIXgB6UlsYHZJEmLqNFp/2JjI1EeaQm
 kK8JIlvWycYoICv4ncIocMSUtRm7GBnYYrl21HPPwU3uMWLPmciNeOSJfmmB+fOcNffhxoCHLi1
 c5f7yIDd3retTYD1AKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,KHOP_DYNAMIC,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k and ath12k.

For ath11k, add IOT-focused NFA725(with QCA2066) firmware and board file.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit bcf20866cf559c19e6f33b10266fde45013e60b6:

  Merge branch 'rubikpi3-adsp-00256.2' into 'main' (2026-10-29 13:06:16 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261029

for you to fetch changes up to 173aced9dec7af5541d50ad771b5578927426776:

  ath11k: QCA2066 hw2.1@nfa725: add to WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1 (2026-10-30 08:08:40 -0700)

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA2066 hw2.1@nfa725: add to WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

 WHENCE                                 |    4 +
 ath11k/QCA2066/hw2.1/board-2.bin       |  Bin 745440 -> 865704 bytes
 ath11k/QCA2066/hw2.1/nfa725/Notice.txt | 3658 ++++++++++++++++++++++++++++++++
 ath11k/QCA2066/hw2.1/nfa725/amss.bin   |  Bin 0 -> 5140480 bytes
 ath11k/QCA2066/hw2.1/nfa725/m3.bin     |  Bin 0 -> 266684 bytes
 5 files changed, 3662 insertions(+)
 create mode 100644 ath11k/QCA2066/hw2.1/nfa725/Notice.txt
 create mode 100644 ath11k/QCA2066/hw2.1/nfa725/amss.bin
 create mode 100644 ath11k/QCA2066/hw2.1/nfa725/m3.bin
