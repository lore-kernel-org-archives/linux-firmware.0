Return-Path: <SRS0=Y23F=G2=oss.qualcomm.com=shuai.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB791C61DFD
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 07:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A75FC1F00A3A; Wed,  2 Sep 2026 07:52:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788335562;
	b=agxSMtBYKh+SYsPdeIDivRCtc7Diy5v0R8qWf63CNcmBsgcM5SdvcXSHs0/SjYqkzdUZ
	 rDLdy9KHhN7Wm/fwssvvw63cMurOD7H34NaYZy91kvdHiluuuyeWDZz8omdh617Y/GMTP
	 SsviQQei0x86TISDBs9AnUTY/RcxcI8DTTI88Gw9c/QYhEqkiEFxZdDFlXncsSx6R+c+E
	 TE3EQotyX9hF149uW9jvc5xbMmvNFl0BkU2mYdl5BivOqz12x2nZzThDOMm/7U65TPn2E
	 TXIq4Q5XcbWLQHy1Y7JzlaMt3MNqCCK6n8c4jP8aDK9gaGo8Z2eg895bcfYCLczLCWQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788335562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0SdnvOup0s7vHE9/nCmPn/OFOY4nZy/HL9HgPySNlCw=;
	b=xaX4Q7/y2ZgFc4wSllHDSY7HMmCym8okIRTv3gLhudDz9dRUHPCHSjDqjH1CHW/hVcP1
	 u/W7G+92ozQ2G+v7r466JhKzwU2XH072mBT3L5yD2rn/zdkaTmwFYW+uab8eVTg5AMsg7
	 vgsD/xP2FAbnlVEH5oePLR/bofteL/67YFRVqd3wVM3nrIWpnLj2KsW/l8rIo19Sf+PSO
	 /FZJ1Xh16a3Lt4EixGQhWEYM71JyP28oPtuTGp19he56IdQpCOte3ktOwqgkTF6mTfGQO
	 ld4IT1QmAwfFZmzb4slfOIB7w1pkkMpkILKOX9rsNKvvv7E0VBJqDnyyA+hRq4e8MZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="C8H/Fizc";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VO7JcUGo;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0650B1F000E9
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 07:52:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C8H/Fizc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VO7JcUGo
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 0650B1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826WAur588347
	for <linux-firmware@kernel.org>; Wed, 2 Sep 2026 07:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0SdnvOup0s7vHE9/nCmPn/
	OFOY4nZy/HL9HgPySNlCw=; b=C8H/FizcR6vPDkm4VRYy2NSssKNA0K10YMNmqE
	t0LU7sijcwaJ/tPqF+nt4ssQRl4OegjzJBgu0FEfcMqw95dSpB6jiKdOLmnVYPlL
	/O8tiH60q4ud04jwfj8dV00Ju8QuY1nmGBb0JKepwVCYEFOkF6YdmnzsL2yK7CJA
	Gx9J5TGOSzr0EekQZojnlUTE3f1ieD/O3ZaCRxThryUho55Ixx52Edkdj3RFqn9v
	DzyRvzc4PPCjMjnz22ScXFjfovD61diomW8Ne5lkXyQPkATFBqwCYZsVXd5HYXDs
	NqwTniLHBF9VzJy5TANEQlKlw50Er4Z892EyQNxLEhqfF5+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435tj0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 07:52:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1039483a91.3
        for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788335560; x=1788940360; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0SdnvOup0s7vHE9/nCmPn/OFOY4nZy/HL9HgPySNlCw=;
        b=VO7JcUGoBY23tA8j8L2+N+69a0CRwAiXuisIjBnCOn6xaIgmHxxO7+lFPUeSebU1A/
         RzbPsB158kGkz3udFBCUr+jl6tUqaZiTYuWf6v9lfSxLUuHi0UymfZTFcT4vUvbYXCPv
         taBgNe483BZJza8gqn3HOrSa0USa4PorPNAbsrMJKUulUsqjRjvdmNeIcFSqwEzUn2Kr
         E6tn0t0dPewACU2pl5gyBJyMGZfDRnhiOZPajqBsX0VJocynIMfrrTP0Z9j7/x0HNzgh
         Qlwt97woekB786MkEOWWpfPMlItGwQE9/t86KEljHSaMxv3bVdwP2TG7zeNHzAhr8Ol9
         gzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335560; x=1788940360;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SdnvOup0s7vHE9/nCmPn/OFOY4nZy/HL9HgPySNlCw=;
        b=YVXV+T1ZU6QFVVeDeADIvxvMfkzsk3EvUW6SFjfCQ5M0aXP+yJjQE2GcD47CzE+e77
         wKPtEkLP25YdzZLp5JG8/GeS8Fm4qzOnYdIHsthkTxtwKZBtsp6J593lrJFaxF6yvnvq
         L0uCMMNJIbdmZDHpqrjsOgDWPlB8FoUWsNekt7kYOx3mI2oo4F61ZB1yK+I2hxWvJNEf
         U82OlCG8JU34UZXxpohEvcXzmDvYOvV7h5MMWnOno9ql6RVB/k9PWNlZIFZVC9MAxU3b
         Hsve7RMFuzGhf6qrmXPrT0morp5kvshworDq9gk2uAmIdTKVsZ05ybGQLJP+Ph7/qH4B
         /JzQ==
X-Gm-Message-State: AFuF++kI80yFDuBuiDmvsYH4JkNTvBrPXf4TNtj7ohRQ5tO8zoVm3Tu3
	A04uNH6AyYCj2YTNL3Ue7LMGHIWPBVi8/hPZBmV136Ki2B9DE62quT0dzWSvfvGiL5oMXea29zn
	+W9MtJmDF3WcERApLIwLEdnYFb8tE4LcBToUhl6hQHX80NtQD97dKOWWTQZoMMIa9uHDdXVQ=
X-Gm-Gg: AYBFou2es2UtYxiTK0DBesY2N64CInjQ9U4jOb08/rAnac/3XLlIGiCgGHQRZ4xRfDN
	MyOYtjrGNTaDZiyjwDfejm0MP73KsZxHlYnpDkH/1gZV6IoxD6bioEmyVCxAZLS+VpM1urSNzKv
	/Kjb+vusM6aSoGUYWEEGXHf500tV274LFVQlZ2wIeKrOZfQ90NyZ23YKBkdvw/xfTpqCVklCwJu
	Xm1YNXtdd2yqRx1l0ho+1laQFz9448lqidRnWFq5z3NKcmBkfdYp/tgbRNlXunVJYmJJGe3iIG4
	iWopQbY3Mc7rgSn3JbUq117pm17Yp9+XucI4Vz3SJGJldQ3AqnJCztVh2h46K4Mg8Tdvd1hRIgd
	oHZUFoocrZ/MoCd463qyNQn/YRYQ=
X-Received: by 2002:a17:90b:4fc6:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39aee04acdamr4881639a91.14.1788335559856;
        Wed, 02 Sep 2026 00:52:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc6:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39aee04acdamr4881578a91.14.1788335559392;
        Wed, 02 Sep 2026 00:52:39 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c6e8d7sm4411127a91.15.2026.09.02.00.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 00:52:39 -0700 (PDT)
Message-ID: <182f576a-a9c2-4e21-b882-e04118c0c486@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:52:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Subject: QCA: Add Bluetooth firmware hmtnv20.b201/b202 for WCN7850 on Nord
 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA2OSBTYWx0ZWRfXyNiMzNFLjGuw
 cgOp6wwrBavfgjdRu8ZCuTnorpXpRevtq7oX+r6tfwf+kbH9TO1nKY4sqN5ReJ7Gbu71oejsYOc
 VVU2F6ugXkNaXrOJwjAd4cvOiNCYUogn6tQqjxFiB+SdbrxXZgt5Vebd4kzol2CwH75WzBnhWtV
 asBgOPtcKMraHPq7QlFPeydjPlDjE6k2DZ6+fb5ZaIYLSYjV8zgaKIG13pk9+gpSf/YdKeXYUB3
 80o4XcoOo2OlP8m0NPdPTDT+vdsNsr+j0bh4gMJfIQJEmOcpTjv7jUNTuFXSVolbq105Ccy6JTh
 20Bajc/PrKcrVKdQRZxLMvX850vgJv2r6AvAwYMdSneFwtViSppMXcj5aZJKK50F7MVJBU3gL31
 GmFYiLWpekGgTHvGDFfCPUg+wf6bsDrK6ZcAYjxONxlQblEfDshCZrhqIrXxn3P39oH+jLfclF3
 OzMnZ8AoPLQiYg0omSg==
X-Proofpoint-GUID: A6e4BKCMEt_JjD98MrqFavdOE0oRP-wl
X-Proofpoint-ORIG-GUID: A6e4BKCMEt_JjD98MrqFavdOE0oRP-wl
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97d5c8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=NEAV23lmAAAA:8 a=YRMpW_PTtTDgpG6nZEYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA2OSBTYWx0ZWRfX9hIQvGAjjQjH
 RsDfbqQ/JatiNb9syAR514+PTMLVcWuOkatjLqLYRURieReXYop1P6+7imTCD7/IDNhbNSGpB01
 /eE+FiqzbaEcdiMiaipkqpcR9vJ2WhM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020069

Hi linux-firmware maintainers,

Here's a pull request for btfw. Please let me know if you have any problems.

The following changes since commit 458e40fdbb4dad5134ec230a42df21aea1b5baf8:

   Merge branch 'amd-staging' into 'main' (2026-08-29 13:09:19 +0000)

are available in the Git repository at:

   https://github.com/shuaz-shuai/qca_btfw.git iq10_fw

for you to fetch changes up to 812a572e10d45accc48e4fb9325a5f10d15266ec:

   QCA: Add Bluetooth firmware hmtnv20.b201/b202 for WCN7850 on Nord 
platform (2026-09-02 15:43:23 +0800)

----------------------------------------------------------------
Shuai Zhang (1):
       QCA: Add Bluetooth firmware hmtnv20.b201/b202 for WCN7850 on Nord 
platform

  WHENCE           |   2 ++
  qca/hmtnv20.b201 | Bin 0 -> 9608 bytes
  qca/hmtnv20.b202 | Bin 0 -> 9608 bytes
  3 files changed, 2 insertions(+)
  create mode 100644 qca/hmtnv20.b201
  create mode 100644 qca/hmtnv20.b202


Thanks,

Shuai

