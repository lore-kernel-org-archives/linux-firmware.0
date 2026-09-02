Return-Path: <SRS0=Y23F=G2=oss.qualcomm.com=shuai.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9696C61DD3
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 02:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEABD1F00A3A; Wed,  2 Sep 2026 02:41:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788316861;
	b=gpF1jnFbARGNgtzNC/KWxa14wYxfGRsyIcIKse4vqaladivPYuHpSAIv9+z8RXkCOfFe
	 7WbzAt9bW0FJ6VEseKuevVaZCvUcIPVQUTJKo8rCB3e1nbcNa5BtUV7H084NOgzBkzzzN
	 PnGXWrd4En1tnejQm/SDYz2hfU33Ik0a6NS2e7s19WnlDkTCB9XJ5gJmSm3/N0WQ24cSR
	 o5XZohg+nQy0pl8B6A75IEmJUOCXkf9BwvnOd3PMOgdcwhq++Q6tLhrSXFbljbvbKaC+5
	 RRQc8fZEFZK7IUuz7hpqeXEcc3qP46fTmDi7q1R+gXah3bd1y/2CI4E+zgH0nri0Kuw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788316861;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fA1RMUocZcw/ZQh/mIPkpxszKQeI8hFtFN8XpljLDgU=;
	b=gLchcEqY+7mmGuQ7SSqh0KlCo5IYtiFmVMNrUGsDlxFIawMcuXANcumcd8e0oVsD//3E
	 iDWnjBrJnRmSt9ZQa18+Py3C/0XTN8ZGer4N/q0ODK+YX2Fre9WUijAdw1hgdwumhZ8Ad
	 +eEtgstmdBrt9iUSzpHIZ6FacH0d3AXlzDFRw481xNW3rMeIFuwD7kgd/kQyGqcOCrguE
	 R1BW5vHPUGpgznApcpUNALu/hwZHK/222O2KpyGhP6YEihtnHLfRL8qSrVvjHDBO8zFMJ
	 R4IvOdbzfRIQ2Vx/5eW29u4T9A45cgBBs3Nt2/n86UPiR+rXuS94BjIHzmmUZNLe+Yw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IgxpBz2K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUL1pc0n;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F2C221F000E9
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 02:41:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IgxpBz2K;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bUL1pc0n
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F2C221F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTn7v3849732
	for <linux-firmware@kernel.org>; Wed, 2 Sep 2026 02:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fA1RMUocZcw/ZQh/mIPkpxszKQeI8hFtFN8XpljLDgU=; b=IgxpBz2Kukh/P4kG
	P/PPVixjfo6A559cA30gsHD4ekMGKA08F4CtdFOTcN5hOXQUDVtFw39f7/FA7BzC
	2fZopV9mRgSJ7+K7Nc4kLRCNKnc1OxCfTk59ZwdueeqzfzJ66OJVlRg0447Y/uD7
	W7dw3V58EKHrSkTYpfCPEbHjB6OwTA+6SOwGjILxCgPTr+d2HLPKvagMdZtFQmyl
	h0K29JzBnXszySEBDElVh3sux4Vq4M1WpdL6aMBD/x1uTojIu3H0nIqFu4lKT2m3
	iZBLGwY2bbwX2BIzk7pMiMvelK3STZ48AjFeobU3RZA5bMl/TZmHhDZAOJF+PV5O
	46VNRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge3n0sres-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 02:40:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9057fab9eso8283795ad.1
        for <linux-firmware@kernel.org>; Tue, 01 Sep 2026 19:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788316858; x=1788921658; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fA1RMUocZcw/ZQh/mIPkpxszKQeI8hFtFN8XpljLDgU=;
        b=bUL1pc0nZEOwgeMRnk5ybgxanOGuxZcRk2S4vFmUuyBsMoVhq6HKSrGRICdOowYqH/
         eqiVgmyLH6bIkPbZUi+IfpA8mKurOxm8EXhUOeshu1q+6SjUyNiDz0gtEwdmx3ffhny7
         2bPAClqhO6o1e46e8nzkcW53751ytfxj+RZALxkChYlIDX/H36zxuLhN7YnLcUWZp7X4
         Hs3mdiKkQX9s0J8sFa4xGO3wC7qrI7sns5glt/qgo8NQWQdBvc+ryhStaudmwSr2MJHR
         jvi2MoaQXG9IPXfDG8RT9CukQ9qrVxe5JOVsiD15HimtoNZppRtbSU72WSzLpi2DPYDx
         AM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788316858; x=1788921658;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fA1RMUocZcw/ZQh/mIPkpxszKQeI8hFtFN8XpljLDgU=;
        b=OMUOtlu0QJEswYkREB7nVIZA7ylXAlf1V+Glgedpj0GYAZIzHzB9n0tbGjVPJUJe0P
         2CLb+iq7Hb2aGjIiJusyvCjvuIcgJwmnJ5JopTiYZ0m8pzNbn4mFyrCohS3UCd5sMxSx
         YuqOzGt3VUNUMp3dW1pdypu3iW2LqPztmLzXip0NALnL46r2KKBmbvlKmZMlBVmEkY2B
         sMug6FtZpUTy7rjD+97EIk1Ha7OwK2fjyzPFvi6bT52uOf3l0d+Y8h0NXXj1RWM3EeIz
         fhKGlk3ntUIjjaXq5hV6kckc4BN6tBiznzwIb5CCaOgU88M+V0waa0w2S1deKUK5sfH8
         Vdog==
X-Gm-Message-State: AFuF++n23wPrg/7nO+Pk72Pzfjc13/IIq20GqpQbfrQzc+Ez4iTTcj8/
	GqWb05wQAYjI+GX6VDqQuqaZiELVKOpjyCDvjhE9uC7VU/zN+SCEfK9+g1Uua00bLx3iYuYhwbV
	IxPmBUqk9Zrhzj/J+mzRgzVDgEZcWf/ItZcPv1wjoJ3YARPhW09meweYQgxniGVM=
X-Gm-Gg: AYBFou2FGvMrupGHUH6uHdnySRR5p8TUXkQz8TBBwAnRLh3VinkHLpFU5gua2NjpJUC
	cE8ynbhXzs3PFquePyQnjgN1dOLqgsejrnATZSa1IOESAUVaLzHBiPZrtxOz2f6B9J73Ct7v/d5
	7KDf2j+ISFWSbFNV/g4ks+iKVVwuYMxTVqVclNmrwE73iuOwm6VeWh5Uk6xnBlJyXRm8Nrskrla
	nGDBqAR9Km1SFTNGikXjbZhoAUHuAl9rv4QfGoOGKEM15/7MYkxWa2FAoiYAZH2ctzOmA1fO0jC
	zk0BRfHxMs4t9E8cxy4YW6HTFtgGPXaXcsN05hrKvFyZeZUrvOmiq+VgpsO+lurPvNTK2dttiok
	OqZwYiBzM0pOAuZ76BMNDqCWOE/o=
X-Received: by 2002:a17:903:4405:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2daec5dfb51mr25905425ad.2.1788316858588;
        Tue, 01 Sep 2026 19:40:58 -0700 (PDT)
X-Received: by 2002:a17:903:4405:b0:2d7:1e07:4859 with SMTP id d9443c01a7336-2daec5dfb51mr25904865ad.2.1788316858181;
        Tue, 01 Sep 2026 19:40:58 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd48a9cdsm5363745ad.47.2026.09.01.19.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 19:40:57 -0700 (PDT)
Message-ID: <819b432c-6f63-4ce4-9c80-61453fa8456d@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:40:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c request-pull
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
References: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
 <4z7ylgqvfizcdzyakkaymp4l6hr5qx2g3tddaqvzfqujecbxye@qu37vrgudb3e>
 <0b6bcc31-1428-4652-9855-4a52ae1c77ca@oss.qualcomm.com>
 <os2dizgipn7xbnbgycs3h6fyrcbsk4ybutndexwl5jiu5cd4ax@2xvwaxte5ys6>
 <4054cd15-d1a3-4157-ac11-f4d248890865@oss.qualcomm.com>
 <pckqcqzhpax562yzhinf2fbjqgy2qcqaaoyhw6xgitrrksv5ag@pqv2s3jdvpue>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <pckqcqzhpax562yzhinf2fbjqgy2qcqaaoyhw6xgitrrksv5ag@pqv2s3jdvpue>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAyMSBTYWx0ZWRfX+0Xhrs0WfVAV
 127tYRQsNatfdr+IFZmzlAmdUdn+x/xWjNO1mFMTsVaiAh0+fzU4Or9an1WR4YLmLHt51ysPVQC
 u8ticbI8u2nKkrrLgcL/cVgrmq0yFezL4YuTOmZUq1Dxpl7MgWe9P0Ktf4babj5l+cwjyoyQ5iK
 Op4Odhag/ur3/eED5I4bNnm3piUDq0UGqGgNwq/fNuY2v6f5YS2anukC7Lyi/Kx6bUE3vY1V0mZ
 7mIgsWxRn4Vq4S2CMB1GwO2Cu8RGJACtWC8QwD2ymDSAdkLjDaBzeXVRa5rEXwIzCB7vaO0Y9Uh
 91p/taTz55GYjdKGchqobLBHNW6Lwz8+VAsry0fYudeOo2/3Ss6NypsDEWIIetYpC2Zin8LsXia
 zty27BBoykKuYxWAlz8K3bk/o35sd/pmdsH6S7vbd/rI4IU9AZ4dWqyb7Av7540dUlLKv3f3rOd
 wMnPtzw56eNiRQyrhwQ==
X-Proofpoint-GUID: D6a9U4tnr-iBgj8edY7ZjMM09ot_dOZX
X-Proofpoint-ORIG-GUID: D6a9U4tnr-iBgj8edY7ZjMM09ot_dOZX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAyMSBTYWx0ZWRfX0d32TN1Erp+B
 8RCkJsu3FCdLDWPBiDd5qik8ejigjHtNLpI0EwO2DoEixG4C9BYN10Jwm0hksVlKsgpJxJjOc7s
 tJpRkWGF8lgbCW4LF7d/CXA82AvWmAQ=
X-Authority-Analysis: v=2.4 cv=R9oz39RX c=1 sm=1 tr=0 ts=6a978cbb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=GSjQljFLPMDY6nlztS4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020021


On 9/2/2026 10:26 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 02, 2026 at 10:04:09AM +0800, Shuai Zhang wrote:
>> Hi Dmitry
>>
>> On 9/1/2026 7:05 PM, Dmitry Baryshkov wrote:
>>> On Tue, Sep 01, 2026 at 11:07:20AM +0800, Shuai Zhang wrote:
>>>> Hi Dmitry
>>>>
>>>> On 8/31/2026 8:29 PM, Dmitry Baryshkov wrote:
>>>>> Please test your PRs before submitting:
>>>>>
>>>>> E: qca/hpnv21g.30c not listed in WHENCE
>>>> Thanks for the reminder. I'veupdatedthePRaccordingly.
>>>>
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2
>>>>
>>>> for you to fetch changes up to 2245d3d1eb0593145573a41fa941e4e056031cab:
>>>>
>>>>     QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-09-01 10:51:03
>>>> +0800)
>>> So, previously it was a link, you are replacing it with the file. Why?
>> I checked the WHENCE entry and thought the symlink was incorrect, so I
>> replaced the Link entry with a File entry.
>>
>> hpnv21g.30c is a renamed version of hpnv21g.b111, which was what I
>> originally submitted.
>>
>> Please let me know if the preferred approach is to keep the symlink and only
>> add the hpnv21g.30c file.
> If the file is already present, why are you submitting a new copy of it?


This file does not actually exist. It is only referenced in WHENCE. The 
relevant commit is shown below:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=3dcf6778d29c72f91aa0ac0ef8843a4aa6e11c1b


