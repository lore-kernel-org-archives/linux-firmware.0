Return-Path: <SRS0=fwGh=H6=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF2DCA600C
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Oct 2026 14:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA56A1F00893; Thu,  8 Oct 2026 14:20:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791469252;
	b=ypF4kr250+DhosQCho+xjeN9j59yczYEQQB4mBHGSG/zYsWHbnYXIyLHYdRAmrttxbqF
	 4mpHCHHx7dc/gXWV7cyyW9qa+c3mJhvIR7zPHeLvHCM6HBzVzdXUaz3xAXhUBuDL0V2hS
	 amabRuraZ8t+mkaI00nZVuFLwygXUN4WpwYxLsTVle9WDgzabOHqyqtFGi8jrCN2xdLit
	 1gdo6GYp+D0moI/crNfTr+beZTCFjN/RQpYZLSGSMtO5gjrd/Tpzb5WUz9J97Yry7FynI
	 i1665Z+E1qUiYkQ+HbjWQof+YaHuQjjCZiTCgIselZ8qRHwbmsqxClVryOuJuxW3ZYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791469252;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rxEGK7v+y6Clr/NEXAwMO7mSyCVSd5JGsktyBtBKPEw=;
	b=K4wOB2w3xZcF60nYdmuta7Lh6zBmYdMfJLt47IIiZSCFo/0MqwzZjxpcLFDBAC8wiLnT
	 2hs5vMyqvxN4T0tkQshk1t41IDtoKspWf5nIklgEI1BRpbddOQBnBnX+aJ37etyrvy/aP
	 FBeCZM/YkLyfVrLcEgY6L1QPADoKpyiFAsrQqSv7kLmy0a0jlvhCdxLh3iwzivYFHziTZ
	 lJIVUHBNA1vI3wqXR2NoOdeKbgDBYrnJktwwW0XEf9cvu9W5DbeCbnLaxTk0E/rsgtVnL
	 onBmqba8LtFtd8sXViFfF2oOOAlS2zyq0QHnU2a1ouq/+ytdZgX5oih52syv8tje0ZA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MFsqXdJT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Fiy7uf/t";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17D181F000FF
	for <linux-firmware@kernel.org>; Thu,  8 Oct 2026 14:20:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MFsqXdJT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fiy7uf/t
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 17D181F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKAmb3847213
	for <linux-firmware@kernel.org>; Thu, 8 Oct 2026 14:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rxEGK7v+y6Clr/NEXAwMO7
	mSyCVSd5JGsktyBtBKPEw=; b=MFsqXdJTwAlTH7cYDlo3spI17mCBWcBXjCOjoi
	xlsdii1/5MyLGsiKzkgRQ6Cg13++J2nrl+p7cnEOhIdvYyzWqHZF3veQIrwZllIL
	B1h3LgfyAanuBPvM2IRm9IFEmdHQQqlI8UL1w4uenrbJUxytFCyaKCF1BHzqE+JA
	rl2aMvvG+2cRovHJ8QVm+LWStr99RyBnwibYgq7jbc8gkCtT8tv/eIFILW0uQMLw
	LK+rAqx1JIM9hN3URSQDaV3GVc9M6kwZgrioLVVoIb4OaiFoXmzkEKRMJf+LqY7i
	58BBGlErNqtMI7q31t7B8bkzmHMRaOqOcujgWea89//LU1Ow==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h60sgau2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 14:20:51 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-82169fb66c3so9466564a34.2
        for <linux-firmware@kernel.org>; Thu, 08 Oct 2026 07:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791469249; x=1792074049; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rxEGK7v+y6Clr/NEXAwMO7mSyCVSd5JGsktyBtBKPEw=;
        b=Fiy7uf/tNvAgvRR+nSah+C9y1g4CqNglB7SuRlh7dRSwKX9FEUmb+In8YkIz/X4Me/
         nyPYwGsc8SoGDo7MdLIcCBRnrePCXo1DQnIvcl3DthLSqbAX8daU1397pTjjDY7HHIDm
         FKXEdRivyRRHOFAiiKpoZMP+T63skiYsB6zd1A68A9jMVGyHyWozZa/hugMcUQYBIeYb
         rRY2aFrtX1VvThuF+t1/7cEbOJLp0TIgNTW726L5DtjWhj/B7C1Cojd/sNgVyasu0+vz
         InRfP7ON4343bRzU3wVVPTYdyT4i1t0czWPkd8qj9UjDC0PMjpJbRo8BAoySwzyBGbCH
         /LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469249; x=1792074049;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxEGK7v+y6Clr/NEXAwMO7mSyCVSd5JGsktyBtBKPEw=;
        b=FEgRpO4R836TFP7jQTnF2v8OmYFggAs3ZrCp67dX/yH7AOQcvbWzijqKJZdPBoloZh
         SwW4PXFbgeqdHQ8RIxHcSIOehUh5m6VOCw7vBLwjsVOzWYOTCoABujgC8UPSE+tEoxZg
         jiBsDh7qcNyoSUC/AL4Lh2qng/5wiEuVb74a0wGlfs/195Y4xgp0Kkd7XQ9+k9zUkXJm
         kqBukYDcA477+6nnhTOvftIfOBrLSdM0CY/kTTJM4FbWESfRhXMeBWuv17mcedWAbiL+
         NmvaUBKYAjwNF0lpUhw6BlmXtyKwIYiJvmF7IE2stRyScfBbyXFntV82zL0dOPzYow1q
         2C8A==
X-Forwarded-Encrypted: i=1; AKwUvBwr5bO5i0fck7ewQAm8+3f5RAqo09tFYA1hnHwaxFjFkx2L4DuaGQBkt5ZtJwGWEIXt9mR4LK3a9e0gWLhd4A==@kernel.org
X-Gm-Message-State: AFuF++nre8k9PBNOecVGo64oNfYnxLZypJfrM0UTH1fKYTjAtByX0T98
	7Qvha5OS9BW8y8zNMq37NtBqjlobfhrh+oNfqBcC9xJ2C4b+UAKFwnXoD5HnpUqHHG48df5UMTi
	OloHDdFzr1XUS775AZJT2YOQpqzbyZbYRo2AySkRZPg9AGTuoL48/a2hjBMpJcp8=
X-Gm-Gg: AYBFou1HfyPum6cmNUfFOVCoh7ZxspM/PPkCeNo108g9CHYvZadgB2dgEPicslPyLMn
	/YCWEqRxGz76hxml0WQpfuFtbHRETlfiSXL8Of+mlIH6R5tvUsSHZMY3WM4cVGA5OEyZH58VImy
	u8jIvq2nZxvPhLZLKQ8cvn7N8Un0Or9E7X5H5hjHrdFdBN+B6jQ4Qo0aoVX3mwGlkIjxNFdeLJ7
	xTlpIsJa2YbluH7v4h1KBszZS/ZoxY6rPHkaGuYT/9XVK0rlSM04vzqNGa3hj6lFNYoKpTBLMy1
	+LHSEVT2m9VrS9hNFWYzVMZVlqZ6V0FCEicn6H+v60MgtNNiFgv6jGSam+kWd3n0IKmYXFf6sRb
	BVMbD8B32/vYUVA1oOXuTli06re2eKQ==
X-Received: by 2002:a05:6830:6993:b0:81b:a5aa:e82b with SMTP id 46e09a7af769-82ad00b2bb2mr6577643a34.24.1791469249039;
        Thu, 08 Oct 2026 07:20:49 -0700 (PDT)
X-Received: by 2002:a05:6830:6993:b0:81b:a5aa:e82b with SMTP id 46e09a7af769-82ad00b2bb2mr6577574a34.24.1791469248155;
        Thu, 08 Oct 2026 07:20:48 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.229.248])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adc80d2b7sm5696929a34.21.2026.10.08.07.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 07:20:43 -0700 (PDT)
Message-ID: <c67f14a6-502c-408b-8f5a-14bd703d078d@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 19:50:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update HPASS firmware for nord platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NhcRQbB71m6P5Is8M3roxHXm75oZFAlJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1NyBTYWx0ZWRfXyrRK41Rof6Gx
 p4cOs7UpjihGgezEul97OfAStXrZksL9Nakbc3jd35Hsua4uR/f1kdnOaL4ZgvbHpQS4/hJ8K2m
 alVXul24FhoYxa9jXJOKfrRgUyp6Lco=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1NyBTYWx0ZWRfX+NYwIsbjOm6B
 13tVVljOM1XpRsCirciC2ZMuKhouTsr9y/qU0/EyqBTYTau2hJUxyXDFseqAsjO+Q7KjHBc+5j2
 I6jFtfiwwEnCXMQRSyIg7YptKx1q59SpHJcK8ghnjvMJihn1j8VBwL90Jk/3zWN2h9Rxu2UUxbd
 iW/4Jys/Vh3PHUy8KmaJWELm6/aXVznU9aEgaEAGCsnPrQ9w3S6D8c1GVyb4ZQNno1O7GhieMTz
 WgkvG3GiEXuLLIhGHOLGjIT+iK5S8+rgOJOr+it39QS00iD0XdZZU21jRSY7yp2+zuVuW6I4tJg
 nUexbnfp269O76oOV/jNAXC7PDmwRO8NgUU+vajm6y8EgmFs9+gxxRLDOqUMybADBw+HgenT82R
 Cgp+eEciGgmkkciRsSsRBTe1CrucUpbIkX0900KtZ3GBpWMaqvq8IBURa4J4o+42WWy+uGLRzJp
 GcK7rvLE2uJ+Ah5Cqkg==
X-Authority-Analysis: v=2.4 cv=DfWCOftW c=1 sm=1 tr=0 ts=6ac7a6c3 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=2dJqob/H1sOHMIoEqpdn4Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=qC_FGOx9AAAA:8 a=ymPzvEbOTSeJWsDjHFkA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: NhcRQbB71m6P5Is8M3roxHXm75oZFAlJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080057

The following changes since commit 24247053afda2bab6b4ace42402dbf9f3b1305d6:

   Merge branch 'arch14-8' into 'main' (2026-10-07 12:01:52 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-hpasslat                                                       est

for you to fetch changes up to 898bcf4ac1e4dbaf40ffebe12d56890c4e2ea856:

   qcom: update HPASS firmware for nord platform (2026-10-08 19:47:08 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update HPASS firmware for nord platform

  WHENCE                  |   2 +-
  qcom/nord/adsp.mbn      | Bin 8950424 -> 8950424 bytes
  qcom/nord/adsp1.mbn     | Bin 3470272 -> 3470272 bytes
  qcom/nord/adsp1_dtb.mbn | Bin 73728 -> 73728 bytes
  qcom/nord/adsp_dtb.mbn  | Bin 85864 -> 85864 bytes
  5 files changed, 1 insertion(+), 1 deletion(-)
