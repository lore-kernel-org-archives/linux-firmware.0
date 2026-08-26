Return-Path: <SRS0=eJHy=GT=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C5AC61DBD
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Aug 2026 06:56:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECC9F1F00A3A; Wed, 26 Aug 2026 06:56:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1787727403;
	b=wT5kF44RNhIQ9mHh4Wn0Z352F+VtRlfMAslbAEw4kxRCIhviIvB4GIVCQXTOZT808Mg9
	 CyA+DKGBbAYBNEzVFQ31mor+CGZPSqKr+T1Ucri8tENdEynZQfJpBkFeIrTaR9xLtEB1P
	 w52EIs+LYt/et8ieRTKwt+YW3sHiGkcjeY83gCI7SWaN1Vx3xQ9YGKsKdTn6LkhZowj72
	 jp9GxWKe1ZaYBcnzGadL2qcj45NQyd1sc7a1tXoqLyUqgb3zX5DY29o8zWKxYIPUpqTz8
	 Nz+xzuTBIAZ+PoRBgfiy9FvEkzSBurEvSPi2QBYmraXsOVvyJxUpK7sSCoS3ZxfP03w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787727403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XmvFKFL/osh4TA3LF/8x9iK7s/7BFLy22rI/LPsCxmo=;
	b=FSA22LiQl8tJL0VoC5YhZvQNBzf7hEJ0+/myjnVRVShUHeaHli3kVivmJsYWFuN/+fyp
	 I8qzzDYNaWBjNgUEJGuVDNtEaXWG1wJxtTcjrg7xmaG5nVTNuKM9QN6sfeg+ae/iK9caP
	 +qOCsSQtSYz5lZkBouEDEsZ3LfZgxYVBa4/LG3QUeooReP+1JfpC4VRfMMuaf2fSSFFdi
	 tWrH2LqNWVdIpI8FIzzsEg98v8HelBBTUR5gD1h3hmdHOXlY9JMthuAhJF4+b8oD1vbBW
	 U7YBSTmi6RxaURKj1mnsnmjlZ64KANDyjJbmKn/I4QsmBCZZo5iuo9/XbDiAazF9WfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nl9zvW6P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkAjt0Rk;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 566D51F000E9
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 06:56:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nl9zvW6P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkAjt0Rk
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 566D51F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RjTO3689427
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 06:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XmvFKFL/osh4TA3LF/8x9i
	K7s/7BFLy22rI/LPsCxmo=; b=Nl9zvW6P2FEjLht703rHTlqHPsRjiCtpvM1yiJ
	ctq6GgLoNPkHA5uxOX0Y1/DX+euSNVVJbLQKxf0FJ2HAmCHur6UZ894UZw+1+GkK
	mRhLXNP/7ybrE4ZOnUDl6Mwz78RujaQUXZbnExIvrNbpGOhY3cHBuMflIfmrk/AI
	/cV1b1+zF9o2IodrA39vqO1JXSL+EubR9I5wToyvLfKaVNNRvcrR7Mf7zuvxEyV1
	Je5CNYWHMIf4e44XIrfS1opVxvpifiaNzms9hlt+XbeLjOgT49KS4ZmaQNx8VXId
	il9RL/7k5bQLWGcup0q1qpPyjHs2m1dovW+fA4fw8mFzAskA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn2hb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 26 Aug 2026 06:56:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3950b1371a7so1247077a91.2
        for <linux-firmware@kernel.org>; Tue, 25 Aug 2026 23:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727402; x=1788332202; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XmvFKFL/osh4TA3LF/8x9iK7s/7BFLy22rI/LPsCxmo=;
        b=YkAjt0Rk3NPxclkzMeSKsleDFqs8149OMxUF++Ljrsl4FJTAUI+xQStob57oKFsewW
         9MpvU3kieV36AGhndEbN1dguRsLwD+YWwebsI0Zy2irmJ7UpmUWevs2re6Cxv83duusD
         qTEIGUcvp1ncTpvTzFM1RwADYZ+cKeRSYgONWJ+cB1j+cwouxEVk87l3EYRC02NqCTn9
         er6N1Soy70+fmsnjAh9FlgxbNRWmYYDDol3ZGTZ2TxWzkOXt4ScPX1lCXCgjvt2Q2/xl
         MTu9hErNKqm+ABo3rLz3ACk67vMO4FlNgn4T+4SPeObnzm4in/CqeYo8XJS+ws6Pe+xw
         obug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727402; x=1788332202;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XmvFKFL/osh4TA3LF/8x9iK7s/7BFLy22rI/LPsCxmo=;
        b=oRkbrd61q+NNUwqzbcMs/tJlAwRffPyndYJ/y2xMAiZHTEU7ELv9np4iNK2sJZJLvi
         DQNBGMpNFZi1u6z0ebeO5IvTlNpPIx5KCnM6SLD4H94GdTBhZQe32H8HP8edDs/UXOp5
         jAmi0ItPOBVWI0H3wQ79ehIiSOiWeWOnut4/8u/A6CoBCOTeliqVUXvwcVlFT+e6bvVh
         BvDMIsr9Ghh1wiPmtgxS7O93n99hsMzumy3IyxRaoftHTSjrt8AIzf2z67XztDAdJmIy
         X5dBgv0c5VcUgbSbQC/LmMQ2sCrFk5Gs6sKIOtJm8zTXYmj0AEWKLXj6oCtbnNfIgCOu
         DRaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrezd+35HzHgtAXxgXdoQZN9LrKMiG9llnA+miokCmu3WWY5tZpbXKGbGVXtQ17pphx38r+TP4Rinfh+MYC1A==@kernel.org
X-Gm-Message-State: AFuF++lmIzGbFihG/GDLx1rVVBprzMFtfZW5KcF/3ITVe6i5XMw0cxQH
	2hhUvJ2zjYphdgOkna8gU8ZIRxwjuXwyM736UoQx8xT2mO3k+gWQe5mzO/h/Ib7h3snynuzY6Bb
	Fa4oJGYpme11z3DC5gkSrRuBysmhgM2/GPA2tkuKVWiK6JDovKCIH6BPBzENipb8=
X-Gm-Gg: AR+sD10BHpuexfP2yDwVHGEEcA0NpF7fO/M589s5EYvhuoAVFMua8i2Hxj119Vlk2bJ
	syFGnHqW6mvGO261G21VeSnL4mfsvk3vaVXcQoC9/prQhvNFOVTTeom7k/1vvNwjQdbvKTW0uqo
	u7psfhcUKvQBFcPC3I4xgCHsAaB/WOs0eJOVvSoDz0YcZsyR2d/8DCDRtf68SljGGMEXbDIt7C0
	ijD33fXXdCH+WAOE5el6bKWP6xwrEh6KM7uK4ZJjMKo0bxZBmXeY8yr+ZVAYo/syCou/Pyd3bZA
	fFwi00hCnZYddfLJaNBvDsX2wGg40+FIdoCV7kcBENbngzDodcX9rcMwSrEhSVhFKALczHoHb2O
	zd1RwkfDRr/SxGpMPC8rHQdXvxKug9Q==
X-Received: by 2002:a17:90b:17d1:b0:38e:8300:af51 with SMTP id 98e67ed59e1d1-3966d20b09fmr8712182a91.8.1787727401996;
        Tue, 25 Aug 2026 23:56:41 -0700 (PDT)
X-Received: by 2002:a17:90b:17d1:b0:38e:8300:af51 with SMTP id 98e67ed59e1d1-3966d20b09fmr8712115a91.8.1787727401512;
        Tue, 25 Aug 2026 23:56:41 -0700 (PDT)
Received: from [10.219.56.152] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da25c09sm8903233eec.31.2026.08.25.23.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 23:56:41 -0700 (PDT)
Message-ID: <9198246c-7518-4c3a-b163-8b3ecc6292c2@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:26:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: add HPASS firmware for nord platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fSgaX7DSYUS3KWsBN7WPmyTm7JSxYtMI
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1NiBTYWx0ZWRfX1BoA+j4zsigJ
 svnyLqhmyhJOs8ZrsZ2kwxGnt/ofyg4bG9BByWkalmJlS3fMrjdINU/JNg9EjtcQCMa/UQq2yK9
 MzJKjBJK/YI+yv613YqH3h1mDnEvol4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1NiBTYWx0ZWRfX+4Q2ybfb0vAk
 EFUJoOA4/3WGFcTRt4UXxOVOsL8/iTtTZiKdwlcqqmmgF9byXpJLSPGu641JNic1bKSvG2/BmK3
 cIAetaVwmH6ju8pXiw1QPGjTTYuhVqwjkAWAm+AeUTQeUx4xpHudx9le37T8qAbRktYYpF4yGGL
 wDBYqW1MJwClNNtPwFpMXirsQS2uAOlt/UEwAldjXXVK9u1OFWAu18CJ6+d94xjLbophqIwV3Jj
 h7N2EUqNKBrrs51ZFnpFGrlERsAUO9WqYZAxK5Eq3C6//53VBdBIjrmEK7fBEbE6VuR2wRF4mp9
 dO45jCIYqvO6bsdH9HsiUhzAPFDrnzu33ARuxwNDr0BYw+oxJYtOa/0EhAke+1mqxHshyuC+nit
 pcJq7T+u8EQztA39l6CbBtT1YSyVeCOfpgNeOt4YOeNZR4smI8nNRhCNDBLDbx5fCaxFK4/hE8f
 Ivbjrlz9d8+7bUfZjCQ==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8e8e2a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qC_FGOx9AAAA:8 a=VUM7JSqLIoDePY675x8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: fSgaX7DSYUS3KWsBN7WPmyTm7JSxYtMI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260056

The following changes since commit 01205307636157a12c29e6a774bf83b218732050:

   Merge branch 'sa8775p-fix-sig' into 'main' (2026-08-25 22:03:45 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-nordhpass1

for you to fetch changes up to fba487041d4194d30fb599b04285ad9cd766f281:

   qcom: add HPASS firmware for nord platform (2026-08-26 12:19:47 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: add HPASS firmware for nord platform

  WHENCE                  |  11 +++++++++++
  qcom/nord/adsp.mbn      | Bin 0 -> 8950424 bytes
  qcom/nord/adsp1.mbn     | Bin 0 -> 3470272 bytes
  qcom/nord/adsp1_dtb.mbn | Bin 0 -> 73728 bytes
  qcom/nord/adsp1r.jsn    |  22 ++++++++++++++++++++++
  qcom/nord/adsp2.mbn     | Bin 0 -> 3363776 bytes
  qcom/nord/adsp2_dtb.mbn | Bin 0 -> 40960 bytes
  qcom/nord/adsp2r.jsn    |  22 ++++++++++++++++++++++
  qcom/nord/adsp_dtb.mbn  | Bin 0 -> 85864 bytes
  qcom/nord/adspr.jsn     |  22 ++++++++++++++++++++++
  qcom/nord/adspua.jsn    |  29 +++++++++++++++++++++++++++++
  11 files changed, 106 insertions(+)
  create mode 100644 qcom/nord/adsp.mbn
  create mode 100644 qcom/nord/adsp1.mbn
  create mode 100644 qcom/nord/adsp1_dtb.mbn
  create mode 100644 qcom/nord/adsp1r.jsn
  create mode 100644 qcom/nord/adsp2.mbn
  create mode 100644 qcom/nord/adsp2_dtb.mbn
  create mode 100644 qcom/nord/adsp2r.jsn
  create mode 100644 qcom/nord/adsp_dtb.mbn
  create mode 100644 qcom/nord/adspr.jsn
  create mode 100644 qcom/nord/adspua.jsn
