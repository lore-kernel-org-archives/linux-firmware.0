Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B3A606A328
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 08:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWcG9BGz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MpAE4dPR
Received: by smtp.kernel.org (Postfix)
	id A3D9E1F008A5; Fri,  6 Nov 2026 08:21:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793953308;
	b=utlYFpevBtzHu98AMFkGCBdgSiTcLVgk4winAFDW7r5PSn0Ea08H7E2XSBTZ5oyyDste
	 Q8V4flNxdJWhBQA6L38oWaIJUf6dg8/bFzmIlJtweJAGYYgHdZkdP+q8D4EwaRw6ycHpl
	 eDpM9PshP7RShDFDoYq4P1WD4lkq/xmlNnIJjol2TyssWBB+pn/WXTGBn5fqQgn/xjmD+
	 fi0RIUPuuuEyVMAe6i4IEEDhvAdH6pGmuWHC3+9rla1FaBo56sUCncust2FtaO+ZjbVh0
	 6zbMRAKE3p/zBgaIFkSfDO+Zj+pVAredZcW6Xr+v8i9lZAlL21UsMxLKd0e4J4k9Suw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793953308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iOQbw5EOE37hufpxCbQQcMTrU8S9hXY36lBGip38pA4=;
	b=jg03JMK4Ny4N/46IKPeYx8ChT/negozkBEjfjwggckvy0ouMe6cHAVIEatnCgA/6gekw
	 Nl95pAKxzRZ3+Ye+FHRNf8ArXdEUY+au54ql4LGmcxC9BaW0pwBQaO5/VthVnHTnTxjXp
	 z1SlD+VZ8ty6f3j5nmICNXT5gqnbe8bc1RXnGCGxwiFsWQ275YwpOVo1czfwmRRmgMSlM
	 0RTiMBYB8fzmo+ZOtQs33Vir0FxMVnxpMMnZZZCDgUTEL+06rHk5gISpQyPWN0oM0177p
	 f4WVA87Cap0I0oGkzTBixRkSH9NQXoLBCmNExKcLcdI9qHC9IDx21XDAZjaxD2xEqlw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWcG9BGz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MpAE4dPR;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F097F1F008A4
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 08:21:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWcG9BGz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MpAE4dPR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F097F1F008A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RmCf3883489
	for <linux-firmware@kernel.org>; Fri, 6 Nov 2026 08:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iOQbw5EOE37hufpxCbQQcM
	TrU8S9hXY36lBGip38pA4=; b=pWcG9BGzQkN6zEw9fomOkdzpj/PNFu3GjyjDNo
	eW9WbPMdwKzgPalWJmNv9uh7wbkv3KGVcu7TFkzEYZNZbJtJe5RdM63lUShpB9yy
	o9Pq1pBpSz9UI4E53D2bqu+MW+1C6sZT82ubg45ZfiQPpFUjxPETAzxpBqOugcnP
	pZVBkbcN17CPu9/zfawO16pnSUM19IhKm0BSvEWRc+ThKrzOPikiuKCzPpgl528T
	yH97IyYx4TyfwfxpxjVK0Ug8bQ1zQwcrq+qASk4rT1Mda7nwLKHMr2egy1qjtpYJ
	nriH1qjfC6rclFs7DdvToSMR2Z77bi5PzZaqD/oCGJ4G/5pA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb1txx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 08:21:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso345958a91.1
        for <linux-firmware@kernel.org>; Fri, 06 Nov 2026 00:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793953306; x=1794558106; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iOQbw5EOE37hufpxCbQQcMTrU8S9hXY36lBGip38pA4=;
        b=MpAE4dPRiuOGr4lNUqPRMSnrJxZJnMddsvYgIOErO1AzdOHT/FjdDnbXmMOLMU7ohK
         syNxF3RTxiQEwJhYafKZ/s+dPGaaNcmTUKTpFALem98qRVLng3gvKyUOGAATzQVd1+Fs
         24xGN6KubTAHaErz+VX7u+Lq+AhIK63Z4Z2AOqu7e3jbiDbkt+1TFQ0layzMs3QcnFTL
         /aXz/qXC4KCtlc15q6Ab8a3OxiuttNQtGHGJRtNGvqPSpmkhuObm9GJAylcg7qEmIMkn
         P+K/FGmfgG/KruWdj4A21JTQKJ6TEito7qmR8s6hG6TXnGk8pPa3LPJFhg7hvWJxl+vU
         LJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953306; x=1794558106;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOQbw5EOE37hufpxCbQQcMTrU8S9hXY36lBGip38pA4=;
        b=idU5E/UywrjuU8TSfrh+S2fEzf0C4juCp8wGVEtA9xNiAXD17QEr0yZWUGQH/+DjuH
         9rTrHok0cvWL2HdmINZUvZSJeCES7zPXExp8WdnC8W5AfwQWWVYRGFYvuBLwwRJhotNQ
         jSGYlh2W7OQZvmBGd+UaY7pUlDTlwDFslFPeeW0dqynjN+wr07fgXZshwOODjpr6gUmJ
         amK0Wccg3+ZXtA5ps/Ryo2kXkL+76sFGUkyckXDMCt0HaD3/JkvVm5dusKmnDZf4hdv6
         MkxyIgOGqd5u9dAnDzZOznRH19x1bM7v3J0zyHNjOf4n0+0l12SgnQZIc5o939303gez
         +qhA==
X-Gm-Message-State: APuU4Z+wBYKFGVHh0iucgGdCTrBsFN/J2sg08zxNa37BuCBPKOUoDLZJ
	bvQ03AtbXAGz43K0jI+e5HqenhvM+nqrRynHnU44yvlYj/kjFq7HDLfOJLR0rDpvEQgaJo7vemG
	k1skkvG0ZKTn4KDR9KeAfQg9uJZVuBTz9pG+zx2A5lX2Kodvsau3CK1U6JtWc6sJbgkFfPZI=
X-Gm-Gg: AYBFou3QV/lEKQGQtRTEEtk09BJODfwC4aWkj4mgaxM87fHFVTmEMItnRVLkkU6w3Gc
	jDk4h6F/b/aWU4KYisuCUIyyoe563ahs/hYhq6qg46rCpO1EvijtTfDqgl3w330W5WWQlF2mL4w
	/AQCVNKrJJ+gPknA+Fm+j5QALRsV5OGpneUNUSXZNSZ2menT37P6nV86J1DlbQYS6CIb3zsa1fG
	HMv5Crhf+PW8RE8EF//lKsnMjiznraxUbfU4jvPIOo5kffU6kuQyumVksrvuSuNzqA+U+ig6JNx
	y8LHLiIYNTWbcgrXOReHXgwccDlnVxt/jaCVUeqaA/b21T1cAlQNsxQI4esg3i+pLDlDhxLPJBH
	In+9vbqQQN8dgEi6CLuaFEYpr5QpNiwyuciEgahqeInFWFg8e4bVgwFZhrFDVQ1R5yRVbwZvgeR
	XEvP8Qkr0=
X-Received: by 2002:a17:90b:5343:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3b0db72df1dmr1764539a91.66.1793953305760;
        Fri, 06 Nov 2026 00:21:45 -0800 (PST)
X-Received: by 2002:a17:90b:5343:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3b0db72df1dmr1764514a91.66.1793953305266;
        Fri, 06 Nov 2026 00:21:45 -0800 (PST)
Received: from [10.217.93.113] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e2645baesm472539a91.0.2026.11.06.00.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:21:44 -0800 (PST)
Message-ID: <c00a557a-4310-4660-8c92-c7388f7e5a50@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 13:51:04 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: dbaryshk@qti.qualcomm.com, rajup@qti.qualcomm.com,
        raghukan@qti.qualcomm.com, kbajaj@qti.qualcomm.com
From: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
Subject: qcom: Update qdsp6sw firmware for shikra platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z0M43wSUo4b2E1PyiddiPyFdWSAaqlNn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfXzMrndwCArVm0
 XwGHnSSPIzyuwk2x/+kHkr4qwmQ6V9lInS6gWzjckLA9amMFnDypha3xo2Z4I3BtKx+kBm2Bzmw
 okbjRPQeRaMyDJdOsA5obkQhmVMNOpc=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aed8e1a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qC_FGOx9AAAA:8 a=v3McTKCeBYw2xIJOfkgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: z0M43wSUo4b2E1PyiddiPyFdWSAaqlNn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMyBTYWx0ZWRfX/fhamiXibFVP
 to1RNg2mgSDgnlZbl6jE+ACNrcZA9UN3WveN4DNoHQ7lBEIYGV6rarSTTwYuHVc2CZueRdMm/Ig
 SiDj3m21g9zai6olRLVV6dVOltwf8X6TZNo4YW2/+E94ey3PPRBeVU7qe1lMwAtyZtmfICNX42m
 Kg9KejnSgVt+W/CX75SmociU2H7uyXV1SNKHKC1Z8duaNa4HFz/guWIbIPC1YZomIW+dDqqzlbm
 xwkHFOjpc76U4Bwx0fz2GyI1nQk5IC6zVphXoKcr6NVbuTXNLD39BF5d5CYZPPJYfFL9trBij1e
 viUaytwrVGJ0by2XYRDf5X42X4/ZcOOK8Kqj1QeW+eye0A/UE63Nb36uZCNTj/jrwz/WJCngX6Z
 D2ZQJamX0M+0SE7LZkasgbu+73gVA+cEUrdG0lbKdtKicn4GXCW09MyAIrVWrNptN5HouPClWhn
 t8xTs0mJ1jBvV4l5l7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060033
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit ba7155b16ca701e48018e746a49f7c9aa8392814:

   Merge branch 'robot/pr-0-1793892246' into 'main' (2026-11-05 15:35:15 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
modem-fw-shikra18

for you to fetch changes up to 308a73c07144298b24e96315b71f7fb20fe88a77:

   qcom: Update qdsp6sw firmware for shikra platform (2026-11-06 
13:27:21 +0530)

----------------------------------------------------------------
Srikanth Katakam (1):
       qcom: Update qdsp6sw firmware for shikra platform

  WHENCE                      |   2 +-
  qcom/shikra/cqs/qdsp6sw.mbn | Bin 5668216 -> 5668216 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
