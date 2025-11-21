Return-Path: <SRS0=SsjS=55=oss.qualcomm.com=vikash.garodia@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6129ACFA762
	for <linux-firmware@archiver.kernel.org>; Fri, 21 Nov 2025 09:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C851C113D0; Fri, 21 Nov 2025 09:47:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62FAAC4CEF1
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 09:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62FAAC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8YpVo3139454
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 09:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ewb+VONgnZNmn4ynavTlA6GQo3ROzwbwNJh543rsmmI=; b=M+8deci6S1/EtkK0
	in648do69yToewNUZbvqCEpkc3at3etAgpJ7mdzMZxL3jbiH2qG21qK+NkAqL4FV
	tRlLsOueAx9O2fHNR0Z3agyLlHWNnUBDPuHzeTifJrncEPaKZ4vx1rB00Q8gBYDe
	JAQ88b7KCKzYD+IN5eUbUs9eMsKcl/8rTc3ATk2mBP2n/lLRGcc0YiPLaPhVD2F2
	NaXtmnJqMZogZ8c6UHoqylq4dpOW+85nQJK9u950yEIrz7AvzIFFEHPEGjfes9xs
	8TigcI8CHuWD3QF0Ytvh/ohItOdku7eIMtvMrpi/G7ovbfIVkSYDy11wDEYp6Jfg
	LSj71g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmppgct6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 09:47:30 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b8a12f0cb4so2162685b3a.3
        for <linux-firmware@kernel.org>; Fri, 21 Nov 2025 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763718450; x=1764323250; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ewb+VONgnZNmn4ynavTlA6GQo3ROzwbwNJh543rsmmI=;
        b=kQt4Uj8wMoGQBGWNItTv/dbXZ175lelssO7jfihIs085GC9iK9YVPEKolVWhg9W3kp
         Uqi3h4iO6aRytr7BlfrM2xQBUves5MuXilyzqXY4HihGZ668Vw4YlJZSUZoMaMwdVx4U
         zuDLGJuQkL7MORpr1ZkIG+1Zy95BsVhPjjKWAj0EFcvBgAwkhCq4cINGNYnRIBIwMsi4
         vCgSBAX1GM+1Pj+eQEpVIYs4hYsKeXS3yCUMwOkkyO/Wbub7McTnkZlfH2RnEDJT1VJY
         r/rxtHWADx4WVj8vRAt3pIqRNqaV4m7z0orZCgm9e+5A3kN5aYQXyxxuEJ1GQCJ/5uhE
         qYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763718450; x=1764323250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ewb+VONgnZNmn4ynavTlA6GQo3ROzwbwNJh543rsmmI=;
        b=EjfoGpqfI1YzoOVSqJfdCDm7wyrgbCxSfn/SaHlNI65Q4YP/84wMCg+FT8sTNq3WpB
         QLU/XslPu8liHCWSdvbY4RZLQjd30CX8GGakUo5k3na5wfR31GqM7VB4PMmcFdT33H9M
         0PpyiDhEenL/DO406ed8NPjJJbA22ZwSrgO9IZK2kV251LUAaEf3+tou7fSKC5B/iS2X
         qhlH9Yxq0RVTUj6O8RWo2NK0yDZ18taR2cvwNVE+3qeKjQ0QP3z8qZjCD9UC5Nb7hROb
         SgfwyIji1A/4xBZt7UFr+80Ypjz6ByUcSLd/EAMuuS58HwwNO7Vt3PrYnz+fLzLwj+cc
         cm/Q==
X-Gm-Message-State: AOJu0Yz1O/DH2sXM8b4mpSe6wq3bAlIeeAa3OW19Z6Q0w4Ze0O/XlM6+
	6IrbFSU2RUeu557jylpsgPtedwR4XISUs2vEJPtpGliCspvQ0fS67QxW/YkSR+USjyGNyrbAacd
	KtDxoM0/JFSpIVlC2KuxBm5WSn+29EkyE++wX3U5dLhgObfAWOPxB9feRIkIqhKU=
X-Gm-Gg: ASbGnct+8ETjkJmq2DvI0zqvzqdkKKBglt0VSECi/C42NYsWLzNJuqK8NoFLpUk2r5T
	qSmfKgvVz1CCdGzHcfKtcKoXka4mpanYtI5PYD9sARZXNkokTBcJBqP/wtloENFXNXq1ymeuesf
	VZEG2D6rXI7pzzz1mjmnN/FSYGN5IK3RHr36/Ob55aTa9QBzv7qVA99GB2J25H6Df2M6cpYeAxd
	stAqpspCpkVzXjNO2OPRimgrQR5tMWcnZc5wim3P6I2Q88oDZRUtFmmLak58B/hB+Rr3RxFoijE
	PaIQlquFT0J4VWsGTBNC4op0tJADL8ffch/u+Bi9pmoNEhynfBgTVDfjAtfIFU5+nOBGXVlr+sb
	uYkR0cEjFbXLHVLVu8Lim3c5WFbakq45IRfdnj9qncs/j
X-Received: by 2002:a05:6a00:92a2:b0:7ac:acc:1da with SMTP id d2e1a72fcca58-7c58e700251mr1768090b3a.25.1763718449638;
        Fri, 21 Nov 2025 01:47:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbqwfYT1Fcj6nwOmrP/SlhnE2xxAynQgT/QBoY6v57yAZOGispSHSlbN5R/F8v3dD062y8wA==
X-Received: by 2002:a05:6a00:92a2:b0:7ac:acc:1da with SMTP id d2e1a72fcca58-7c58e700251mr1768065b3a.25.1763718449185;
        Fri, 21 Nov 2025 01:47:29 -0800 (PST)
Received: from [192.168.0.171] ([49.205.255.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471060sm5505713b3a.15.2025.11.21.01.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 01:47:28 -0800 (PST)
Message-ID: <2b7be357-3a11-4eb7-ab6d-fb58c7909b07@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:17:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: update firmware binary for v5.4
To: Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, "Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        dikshita.agarwal@oss.qualcomm.com
References: <d3442fba-a616-4260-a2c1-bf14d0d64250@oss.qualcomm.com>
 <jlnmauqconyiaujadjrffjeqbzkc6pa7vrcmnjyueuuamfguhg@ln43yypqrvoq>
 <7111892d-1351-4c94-82f0-8566c34f16c1@oss.qualcomm.com>
 <jodkivawdceoc7ebzm34w5ocipnv7zpjvasadyha6kdpayluja@255mxfp4eq5f>
 <1a8feea5-e797-4a19-a1d8-e4d5d5bca0c9@oss.qualcomm.com>
 <fa44f063-0f12-473a-98b1-cc601b4fade3@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <fa44f063-0f12-473a-98b1-cc601b4fade3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: SuUY8Elf3FE7ZZWlr2RSs1mC-H8lYQe-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA3NCBTYWx0ZWRfXzCIpRt0X48hA
 KBYcW6HwbcDENAxO5UYAWRdWqrVE17gvp5YgZddZ2LkVhJu2BGv/oQvd8VMkfLpnE2KTWwPVY3M
 lpdvHnizDxr8gCnxqXxZjAfxBJl0DJDRxSjdQXcdCqKClMA9S2iuoWjsVW8LTpIdvMXofOz6zWS
 5GTcstuaPwb5GnWlx8bw/2EUPB5oc7W0yHxuBIH21NXS4D/I+60JaNGlYsIwWPRwtWAb53v4xdu
 711TM7LOl1D0I39BaOCp1njilF1SgQDkPZQn/muC43ZuwihykMw/L7eIkmsFW+plWshs6m3E7cQ
 fZ7mOdFkH8xLAnrjBKQJ9hd534g0pWp4wctkG834wWLGFQfdXHRLCWH7Nr7UwaAbDWasdy7nsJe
 pjdFMtGL6IoME1ljZQrUnp2UO6VXMg==
X-Proofpoint-GUID: SuUY8Elf3FE7ZZWlr2RSs1mC-H8lYQe-
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=69203532 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=XdReziTb+kyCBPMFtiVEsg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=SRmkkeLj24iloAPXxJMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210074


On 11/21/2025 9:27 AM, Renjiang Han wrote:
> 
> Hi Dmitry & Vikash
> 
> I have re-submitted two changes, please help check. Thanks!
> 
> The following changes since commit 
> 6fc940781a013ad837ed8fea326d2b897467bbc3:
> 
>    Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11 
> 12:02:02 +0000)
> 
> are available in the Git repository at:
> 
> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git update- 
> video-fw-v5.4
> 
> for you to fetch changes up to bb28dcbcf9867ebeda6a41d575656a737c24f32f:
> 
>    qcom: venus-5.4: update firmware binary for v5.4 (2025-11-21 08:55:41 
> +0530)
> 
> ----------------------------------------------------------------
> Renjiang Han (2):
>        qcom: venus-5.4: remove unused firmware file
>        qcom: venus-5.4: update firmware binary for v5.4
> 
>   WHENCE                      |   6 +-----
>   qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
>   qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
>   3 files changed, 1 insertion(+), 5 deletions(-)
>   delete mode 100644 qcom/venus-5.4/venus_s2.mbn

It was made quite clear to put up the history from versions #58 all the 
way to #62 in the commit message, still i see commit message does not 
capture it.

Regards,
Vikash
