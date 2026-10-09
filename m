Return-Path: <SRS0=v5zq=H7=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66800CA601E
	for <linux-firmware@archiver.kernel.org>; Fri,  9 Oct 2026 19:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33D691F00893; Fri,  9 Oct 2026 19:51:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791575495;
	b=aUOapMlZXpGz9HC7nLRFLQDjbA4F20XMtzFM/u1TVT2Qq4e/zCIPCq4BLVo5NnKPGDWU
	 fihiEXO21CDYn5IaWp+YLjmOndsAyfswY8gbpZfEzvEOfCrI/SYRvnURP9UoTM0XuXC/n
	 BQ6/ktaDltlKN7YekQ4BS03KfQqnRsgYD0DuKmp8mQQDNsnisM+MLe+yNRINBJwluDoz1
	 EctC/GhOH2seNVpModW5UxeFOv96KbfVzzkr0KMTD73bWXDyKf/XZ0z/1H/14vZTLYIrQ
	 oI4LPZZDLkUoEfiJKFbPax+bxCYPFIU5B82as6H9ztkazomwesAkhBhBRoAThp7l58g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791575495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CYphrXpNn65tc03mjNb3Ye/sK3kH5LpKnA2dPWbuYXY=;
	b=GVJoeqdGfFAnNX42iutILkjmja/n3Jf4bBSg+r8m8w4lOBfxto6VOKdvaFhVG/0QUFid
	 mbm/H4q310fPkkgQS/OjPWIB4IkUrnu3FUB/xlXp5GIrLnSEiIlfsAGT2O5AiQevPRK1/
	 4IyFA4MTWrXzamf6u6Vr60jFzcGbBHY/5y7N9Mghs8P04/C4Ai5M1zjK8A57oiJQa9dAw
	 1ZT0mT6Rfxzaop07lqV2d5zU7edWe7qu+KOZLvb64M4z8Jcv255igRkEssb50W2m4mge4
	 9x+HA/wIhgim5Gg4uPSagEVlHRTo0qsOhTtc0NNwQkoLFm7WcDtLVdv5dxuQ60K1HGQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UskkpqgE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LR8MBYAa;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C12F1F000FF
	for <linux-firmware@kernel.org>; Fri,  9 Oct 2026 19:51:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UskkpqgE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LR8MBYAa
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7C12F1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZdhT2870738
	for <linux-firmware@kernel.org>; Fri, 9 Oct 2026 19:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CYphrXpNn65tc03mjNb3Ye
	/sK3kH5LpKnA2dPWbuYXY=; b=UskkpqgEQ3D7O/GzmKVZLxctSv7aGtSkdwxnuA
	ns/fRVvxP/bHAewk29x3YSOQSeNwFiNM9ZWBATd7AfrTXZNcl7rswz5rrfVhekvb
	m39hsi5AjoaJ6kS9GCIN7GxvgTy2iawhXcVhl8Vn6us7/XLT4tubAJ5/YgEafKDY
	uw9JwZdFru1WItZ3r3JDYN5HNex0Po9YUJNq+dPBc6BhTzs4V8/HwZtmVZ3ZSNwh
	u6WiKVFz9/h8xSCFzvZDLL4f3XApTr/xGtcUlV7f5LXkNnUNQMQK67dt2SmvHu8Y
	7pBDKmKvECC+nYPPXL46QH7VxjY4HtDSMT/H7LgTZustTJkQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7ghub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 19:51:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34ef0362d95so109552eec.1
        for <linux-firmware@kernel.org>; Fri, 09 Oct 2026 12:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791575486; x=1792180286; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CYphrXpNn65tc03mjNb3Ye/sK3kH5LpKnA2dPWbuYXY=;
        b=LR8MBYAaqCbN20ilA2iAhejsDqH73mOdEndYTRFcH+/uQGFUcE90n3Qk73cP60xLdh
         B1S6+sheOs4WVHaxxn+jtWMc+/CcmFabKuPiKRDWEJ6i8Crzwb0evD2eBWcTI+Hx1tlR
         rXjCF/PpqIqqF2Wgfu8uDtH34G/aDCGvPWDtlpx/1/LQYSyzJ2aykxjzl0ulYGHXmicZ
         yRyEpfngq0MJOu+dUkas7WFgj/QpKD8EgTNTqik0Qj+bNTF2hhFkKCbaSH6hf0lmskiZ
         Qxs1l3mlOwCQbM2U0BDz49nbIT2FYig50dKG666OW4ZfqzLwPmqI32Ea3HKY5vSLiBAE
         Miww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575486; x=1792180286;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYphrXpNn65tc03mjNb3Ye/sK3kH5LpKnA2dPWbuYXY=;
        b=Y+ILvtOSznkt5acfi5neTGkTuH1CUAkZ8JVEKroYahImf2L96QU5k8m3Da3GCLC1lT
         nhyZipzJaodD1MjDbGlbkOPIWohqZSTWUyRtGvOfZ/xDimLuYcNfTOcb7sOIhtzyaWb9
         LRaswT+wNZJqNRyJuDhzVFrJSprB/V9+u8FC60WFO+tm83L0CUP2cnacyZ3H30mNnc1W
         2ab/vhqMdHA3Urt7IiyntgiIszQw/QEgZa2bGHKwzVAv25x6FTgrpDl7xPAuEbC2fn5p
         vFHd6qZinhjWd7AZ4T9FvAVCwyyivxc7C6uLFo0AOGGaikMqxYWHUR/rbCw6lZc9bXvL
         9t8w==
X-Forwarded-Encrypted: i=1; AKwUvBzfn7sxfblz4XxlmyfXFhx7D1UXI6sYIFH+QzZuAAvb1b6i1OOF7xnBgUOD08ye3P80FINysl7eXGgWhtaU0Q==@kernel.org
X-Gm-Message-State: AFuF++mgpM9sdrwxhUuusONr0CPlibRt0ghTJuzNFLXw7bs13jE5Obc3
	T5e2zK+S5RMrYFAjLmCuQL06Ng/E8MTd3obohWxENGHUzcf1kc9TQ4FDd9bX3dQK1SS9eBBxwWf
	wE0SgcSQr/D/m3SJ/z5bboCSY3zExoUGhidEFSwUAdS20Tq9tRDkpJ4H6cJqVyoo=
X-Gm-Gg: AYBFou1n0fVPl5wkGKrW8PDYJ3yEwmVWmN2KliJIkQB/4IeLEX/ZCRCKBszJpS1ZKZ5
	FZ4huUB0Z7RwjtgZDd0nCNZq19dbOcAgTs2G4kGnsrovwXAlhkpXLuWDlNRTKptDsnerdiSUne4
	aXSM+zbzYLHKpj3jqz4odNcK7Is59idAdbLzrsPsNb1/rlyQKw4THsd0JYbO5GaHlogZ9np8KlJ
	dB+SV5eza82n95X2OYYg9v3TmLSblzlA18UB7xfstkPyi7cpa46Z+shwyV6AN2FYlERKfdkrqAT
	QsQxpcuY9FdKFrLHI+B+2ZpB/jO2OAm0l5msGV2KpfSK977QdW+LreNlNB8B8tvUqw/QGjDESem
	GCt5899TOJHQ85QSIcg/ha6dijEFuZg==
X-Received: by 2002:a05:7022:92c:b0:165:8e0c:1886 with SMTP id a92af1059eb24-16a610c9bedmr5125698c88.25.1791575486469;
        Fri, 09 Oct 2026 12:51:26 -0700 (PDT)
X-Received: by 2002:a05:7022:92c:b0:165:8e0c:1886 with SMTP id a92af1059eb24-16a610c9bedmr5125657c88.25.1791575485967;
        Fri, 09 Oct 2026 12:51:25 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.229.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a620bdafsm11205196c88.23.2026.10.09.12.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 12:51:25 -0700 (PDT)
Message-ID: <c1b5ae13-3a09-4cfd-97b9-09e103ce759a@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 01:21:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com, psaddam@qti.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update HPASS firmware for nord platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=W8atxhWk c=1 sm=1 tr=0 ts=6ac945bf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=hL6SArGO1lp8fSiSW377RQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=qC_FGOx9AAAA:8 a=o9H2Jo_oTmhAuuOP6Y8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: VEyD8qHCHzz_Ofc1T6HJTSx3tXns6hCr
X-Proofpoint-ORIG-GUID: VEyD8qHCHzz_Ofc1T6HJTSx3tXns6hCr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3OSBTYWx0ZWRfXwQ2PJFUlx41N
 VdV8yDUPI1fKt0ZsStAFXDqoA3g7Q0kswMufrD4PlmzBTrUyFUalT8DT8MbzHSmrcIwG+bSLTt7
 IrCDEw3ekqDVQjGAJfQDIR+FqCtHHGU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3OSBTYWx0ZWRfXzufpoy3+xRqC
 WE0dbJ4kqDKp7FXrL0FUX+Xg0ywq+envH9x9rmm0aQ3NAo3FBuwoGnf3t6FdIXdUctuObLSpq0d
 1oXzLY/4lcjE/Jc9X0bDX3PpFP8X5hQUmN+eRd9gR4pAxFdRBzA34107vmstHfrsPLMonsOmW/a
 9TwhisXUX6ACvXGsW1tggC5Q8Rl7RNH7rVYfQTtyM1Q8XMk1pqEIaf+O0+Bzb6x1COdvQPD64At
 RS/MBD4A1vsdwPAShmFiavNDjTIwTJpgF/cMoIBj1aVEeGdw8JIB0f84FAgzAQPHApeATQBXLp4
 o0988PPQH0JKq/7U3MfElnPLEZBjx8B0L2EJyY49ONll3y9kUSXYiMy33dsuKsPjvF65s+IeDLO
 auiW1hpbwx/ryHitzDjkk1Jqflugpro5hLoaTkMyHAxnV3sp0KMGGssTBOneNRnNCtCkr6qkU/H
 87YsC/29r/SAa4sgicA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090079

The following changes since commit 7be47f171be4138285f59f58e1a8aa601f57350e:

   Merge branch 'amd-staging' into 'main' (2026-10-09 18:14:44 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-nordqlihpass

for you to fetch changes up to 9bedb63eebbe4b5a9d9a7918ee81930bc6c0868b:

   qcom: update HPASS firmware for nord platform (2026-10-10 01:17:28 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update HPASS firmware for nord platform

  WHENCE                  |   2 +-
  qcom/nord/adsp.mbn      | Bin 8950424 -> 8950424 bytes
  qcom/nord/adsp1.mbn     | Bin 3470272 -> 3470272 bytes
  qcom/nord/adsp1_dtb.mbn | Bin 73728 -> 73728 bytes
  qcom/nord/adsp_dtb.mbn  | Bin 85864 -> 85864 bytes
  5 files changed, 1 insertion(+), 1 deletion(-)
