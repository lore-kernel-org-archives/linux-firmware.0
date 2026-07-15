Return-Path: <SRS0=zUkx=FJ=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED86AC4450A
	for <linux-firmware@archiver.kernel.org>; Wed, 15 Jul 2026 04:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C73931F00A3A; Wed, 15 Jul 2026 04:53:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784091214;
	b=linFHBiYOWTh6XdGwj9/FM6WUYU/E4Y85s4p5hj7Q+DBYpbPi9DofPmRrKc/6oo1nrsq
	 5O6R4AlZBHsZ24AVVnZnN0sMpPDtxGzvBGdPFRFZ6fjsNsefpQPpMq/PElIxVCMAKkXR+
	 kzmAm2+qDGI7grYyVuWImXPTMjhdJ0z+uVitnbVibNbO7OLolIxaeXSRVNVMzfNuUBrrX
	 zFpcoxT4vBr/MXmmylFaCdjfD2u82WCJtuSry7Ar/VkYv1MMuXtqc1rrPZcD3r8GKPET/
	 gQbR7wSUzCxSktDdnkwz+ho/xdL1ZHxvdqejND+uXJKHJdm1ypj9fdUMKQt2Eb1hK6g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784091214;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J9LODlYcmnSV1IwpZ5m3Dx0xva8XvvsAK9wYR1kPBlA=;
	b=ODxO5/kYLWrd7PhRdJOi/GVoDfSJagTnBIfneZDEyvX83v2hGqGV8BgKXzBqQu9J8Qku
	 3pUq5Oo9ou8PIZVIapa68P4s8SLhiIUF8cut5F/FYcwNluWMQNN7JlcqtYTzKOyPjTIOj
	 ShXmoPVoGjRB5zW3q1CKmbVDcyX/7rYzjElW9tT+SbvX8p80zH4ggtYmat8k9HqgosWw1
	 nLGLf/v/L6LEHif9Z6hDQ3i3PB6LnSu4zFBIZctjE4QPmrrZBEB+dG9NHtM5A9JMMxO/x
	 k4/I4wmDxJznGJNbBy7xsIc9uZIRk4orbvMmepKyuEdIeOfwVMIVduQ3Zv20HFzmLpA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ROgiD3UN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuGEcqAj;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBE011F000E9
	for <linux-firmware@kernel.org>; Wed, 15 Jul 2026 04:53:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ROgiD3UN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuGEcqAj
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org EBE011F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lmAr2622261
	for <linux-firmware@kernel.org>; Wed, 15 Jul 2026 04:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=J9LODlYcmnSV1IwpZ5m3Dx
	0xva8XvvsAK9wYR1kPBlA=; b=ROgiD3UNJxjoBEbJYXYx9JruPZuST1WP58yLei
	h2ctS8xWNnKMG8CuoxZYYFZ+deIiS3libEHL8Q8OM/KChvmERW68LTiBuWu+QpCT
	c7TwEJaLk6RjQPoZM/ZjRMA8n9fmaKep8lS5ZhB+OfE9ZOYSQ+TJkGm6EBjaZR+s
	XZzRgBTVJwE3Ovw5d9v5XspCLCMTgoBJb8QyfBCj387KxFvEHu5+BAPLGjsunM8h
	2Wfc1dC7LRpIXGDdZsZluxd1cIp/+BBxm0utuyASTuOWlPAxKDOzOcsY4N/G2clH
	g+9DcUeu5oXuX84sULDwgmr9hyZ4EH6TxZISWEkXgVjn8xDQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vgkpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 15 Jul 2026 04:53:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9fe4c5eb39so3734181a12.1
        for <linux-firmware@kernel.org>; Tue, 14 Jul 2026 21:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784091212; x=1784696012; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J9LODlYcmnSV1IwpZ5m3Dx0xva8XvvsAK9wYR1kPBlA=;
        b=cuGEcqAjqM8RJAntjK0+kRGR1iOYa8gM0ebIeLzsDwdIQAInjJzhFRBg10kO82Mvwm
         2T4/NRF82LuCTC1sNq15Ql7V+7f/xivbAaa0pNUFdVUACLzGze+4I4aUKRGXC2CwYAYq
         79YLWnSAAEQhpmquvZSADdOVrIdT80UCJGgTr3OtQW/x4yPI35dSqcgv29+Fs9OQIiXs
         PbWySJibpCWz9NY0hIPvMtM/baYqk/JkFgGvxECCuuRttWZanYNl1BRHbO9N+nHyYNeZ
         KCFOVk+JNjYfI0iqvnViWx/PjlIRoSOV3dmMwm8IFLtZOfpi7Noqz5VaXKWZeKCt/Xlv
         l4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784091212; x=1784696012;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9LODlYcmnSV1IwpZ5m3Dx0xva8XvvsAK9wYR1kPBlA=;
        b=MWxMHp/Dq7Fis4+dHn2nBaRpB/VWmPiWTgQd3+i5aC2McNaZI8hj1aNcotibv8ak1v
         1br4z7ZUxE1QvwcjFcUAfCXLzz8+GER1tBAnUV/x+UuQY+ipyGz2WQYlWrtMLhYeiU1Y
         Qsiah1li14IhNzVjn1+jceiO1gwCYmG8dJDBMyVjkwrQ3Y6EiTrnsivqbGP4RKMQQs4i
         61iuoKLbNB1qyRIEp4VrQb+Pl6JWZlyp5YTmkGucK+oIapay15Buu9MqjBbGLJX6cqWr
         u3HP5zm4SQ77FD6sqI8sgWgCVNr2pjQtk5KMzASjO+kabQ4cpauHEyzOXMXGMkXm/nYC
         rS/w==
X-Gm-Message-State: AOJu0YwCG3WvMRqS2Py+RE6tBZrmgptWxKDmP2TB4qoMdH4lis/gdKIc
	MmVP3o8a/pXdO29lyp2TDUV2dzKAHOA9n+ocrl4fOTldmc41C/TSu4TSQ82h42qQZIzEyx0/mUy
	BxgQ3FzKTTPVH7kTjnkYBSkDICoRi+MiOxJm2TcITirGSVHH4+U/7ErtrLcn1m8NanCjlBWM=
X-Gm-Gg: AfdE7cl5it6LVdw3cdmBV7WXsLgaIVqge3b29h+9fsELLLMuJZofAshFwcDy0J/RepK
	PBRsSMxxPb1JEpcdC5HqfOo+EpL4QTuPGy3anOLtsq+u2HDOXq0GQLGrhp4C8ivcleRtl745I6d
	4HurYEIbLcZOpmueTg7qoZ1V9EcVb3s5SkwsaQs4wkPWG0ZWha5tp+kUG6VAhgOw+v7cXUSeS8Z
	AUfshNv2AHaU9sPg6lE/6lO8S9IU6RKLxFbMmUX9i0KbaJsODWTAylqTA2zsNETezL7Ly0Csnxd
	XtmX0esPuW5FK1zZ7vPdLBxDuHZOtXYSdoKFpwcDK3KdwNBpg1Uz8mn3sr8bREXI1mxs2gLiV4N
	ctrx8b6OLcYu7UlH/uLpI15Ee/Dl5I46/5l+76MVY
X-Received: by 2002:a05:6a21:d82:b0:3c0:9c19:659d with SMTP id adf61e73a8af0-3c36c42555amr1342270637.69.1784091211643;
        Tue, 14 Jul 2026 21:53:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:d82:b0:3c0:9c19:659d with SMTP id adf61e73a8af0-3c36c42555amr1342257637.69.1784091211184;
        Tue, 14 Jul 2026 21:53:31 -0700 (PDT)
Received: from [10.204.86.193] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm85942596eec.6.2026.07.14.21.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 21:53:30 -0700 (PDT)
Message-ID: <73c49178-d2fb-4a2d-9ded-7c18c41f06bd@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 10:23:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for sa8775p platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a57124c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=YLFo-0mtP1gtP-Xpo-cA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: LevGnMKUs_bZkzByF-0lX0fmNu5Bmmhd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA0MyBTYWx0ZWRfX+QqsYi7LE33h
 CeZv4yr0iZSjtFcM5eJTyaEcQ9BG/c9D+R+2nHGzjBHV+a2g/fyQwNULdd//ArdvSxy/QarS3g4
 7cl2yEKFoLj3ckAjT7PvlVlPcK6oAg6iRR3wBhIQRyP2PiNLOoID8lJKlcrNXJ1nPssH4Bm1i8q
 ANT1qS1QtmqG3rTVpCJ5u//fVFmNcAoRTREMaM3lOfBLr5ZNMFFTvo12GteGeCNWRL/yDyaC7MI
 n9Cwu2zrknt5jfOhgVz/QQyqHKbTkNiRA9P1VJN431lOtFoG1ZotDvuNvhH36o7KMwFppPCSKSf
 J5eKSSoDSdXeGSdQhnbXVMhB8A8FONHyWVBwD1oOB3gPxMzTrjFS5AdTnBDzQsy/XolumZ4kx5p
 ge2GXtbryJKE/CEZCvo2HjpRRAW3ZYE2oSfdzG5QlWjsh785t2Nqq1CHBV5gc5JpKHu6jPVYYR/
 F8+peYETzM9pbgk4LQw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA0MyBTYWx0ZWRfXztQAUprI8dxo
 LvF0eP4VthZRQ4z7UNWjtX7239ld7MAJ5lLMBXuV5KglpqLUh/32et7qa5qo/o2mmA3fdED6yFn
 ZHD6SVBF+gSytF9256RAfHTF8/HAAR4=
X-Proofpoint-GUID: LevGnMKUs_bZkzByF-0lX0fmNu5Bmmhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150043

The following changes since commit 2c35b1ed46f661baaf14b08cebb9201ca802f939:

   Merge branch 'main' into 'main' (2026-07-06 18:21:15 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-lemans

for you to fetch changes up to 0b1b0d6f1623e3903ef86dc15a69ede64780f838:

   qcom: Update DSP firmware for sa8775p platform (2026-07-15 10:20:30 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for sa8775p platform

  WHENCE                  |  10 +++++-----
  qcom/sa8775p/adsp.mbn   | Bin 6803456 -> 6803456 bytes
  qcom/sa8775p/cdsp0.mbn  | Bin 3174400 -> 3174400 bytes
  qcom/sa8775p/cdsp1.mbn  | Bin 3174400 -> 3170304 bytes
  qcom/sa8775p/gpdsp0.mbn | Bin 5996544 -> 5996544 bytes
  qcom/sa8775p/gpdsp1.mbn | Bin 5963776 -> 5963776 bytes
  6 files changed, 5 insertions(+), 5 deletions(-)
