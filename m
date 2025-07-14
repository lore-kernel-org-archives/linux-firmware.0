Return-Path: <SRS0=9QRH=Z3=oss.qualcomm.com=akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8741FC83F17
	for <linux-firmware@archiver.kernel.org>; Mon, 14 Jul 2025 17:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5773AC4CEF5; Mon, 14 Jul 2025 17:03:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF0C0C4CEF0
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 17:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BF0C0C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EA1hwt005931
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 17:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrSl7AQevLVZ2SwIgqszuHWL8W96xv8Ix+qwMmLSYAA=; b=UIx0E24nJiCl30c+
	XO5Q/Ys5EOxbUorXW3azXpYc8drJBnheRdytsshsezvpQ19d88J/Jjc2pNhvMBxC
	2DpWgwwu434yIvFpm+LrxxSvHVtrBYmTKEopJ4Lh5Y1QqTWCzOeCYahiC150ylqU
	ag7ncQE4QbA8Y5zRPecgFtO9jGFMpY06Y3NMtLVUKOjGFZfM4JCKhNIiB4XLh92C
	dYGRa5/Mh/5n7Ss5b7P7W8JvsOP9gazDEw6yyRaxWYhDDUE8f+zEnHKioSAv09a7
	QiSlgzbiL20GIXohyyMStK6wOx/LdyV03R31Pr9VitkdTXylCfofwRsPJpth5eIa
	/16cBA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbdah8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 17:03:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-748efefedb5so4225621b3a.2
        for <linux-firmware@kernel.org>; Mon, 14 Jul 2025 10:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752512583; x=1753117383;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrSl7AQevLVZ2SwIgqszuHWL8W96xv8Ix+qwMmLSYAA=;
        b=VH4GkM7GoFVKMlkAYYvH8hkVcn3wwk1RvspKDwiDqthQ5BvdL4B2pOgC3n3zs2vy7Y
         IEy3P1cj0MOJ6dAcCDl/Qi8V7fIfIDkiuBxZP+DJJ0ZgQJnlyi8LWVoTdtKSPvcLR2v2
         r7CrdzOWzGUPglbaqrZaXwaZ2WE2yacc1N/UoFOtyraU901aTzcCyaSgGpj8fadj0eVQ
         hiHa17x5P/gfegsUPWOaWfayHgnRIt1fnH5pBvmi8AgiEXAt3tpgirIxtfC1MR9hwJAB
         ckbTybpAFTmqkXeNg519hZ+Uske6XELZNTh2Wkj41O3KQhV/UeBcR9AlZjsaYbSgTgg1
         DVgw==
X-Forwarded-Encrypted: i=1; AJvYcCVDCGvdiJ8Tfv6DQYFV9TPgwDUbPhw5/c7sD55JFxQgP0VKMKH47S4juC3mXlguHhTSL+WFgH5EFpB7qiWytg==@kernel.org
X-Gm-Message-State: AOJu0YwXG/DRWToCnpcNzR9jxOOyVxUiQcv3UNPNdZrtm+h+2UXhOyb7
	ZXjEgxJnur7j/Bhc+o1ZKrRHnVl9nXrSxJUDzBDk4F82NELIfpEnSnibBytgnlhdRjZXzqHT4ij
	+JeoGFSyLQCjqaNdcQDkH9qhgfhLnVCBl4mulTxehI7IDg/vCqljLgmnrXh/lRzw4wAudQ+U=
X-Gm-Gg: ASbGncuq0g6bRoXc+j9fsckXKq8c8WjneN2M/pDpXJr405+f/TIA6a1dvdII5tNC1R5
	y4jFaKEidU4vyhYOBOBGOgYNTqUxFo5/N71EqhxQpFdO7h+cPRb4OS+HOKBR6+RGn21M6fZQU9P
	8HRlEmZCbAs5z2hNINyy4ezi6n0p46mH2j/MueheB5MfYDU0SHNBCNGpAZL/y9g8HcnSkTtT/Lk
	Y2Cl2zyorDL892FqeUMMYbM+QGE4/rjPbWk2KXfyT17wGIdgdmF5lbzhXMcgYwvLfSBUzmL6gGD
	IGlQaBrlxEZRP1Vrzk3JP64HnTuK/aKfvfn0/KNvSRSPc/z0lCCFb6w0feU=
X-Received: by 2002:a05:6a20:4323:b0:233:7c59:5bdd with SMTP id adf61e73a8af0-2337c595e2bmr12146824637.13.1752512582290;
        Mon, 14 Jul 2025 10:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyqb7fIjvnrFOdSObpcBigN0LESurWzxflc3rtb//iYSds/Xb74wnse7kE+saq0UoC6FX/Ow==
X-Received: by 2002:a05:6a20:4323:b0:233:7c59:5bdd with SMTP id adf61e73a8af0-2337c595e2bmr12146731637.13.1752512581663;
        Mon, 14 Jul 2025 10:03:01 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.230.95])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3bbe52edd5sm10570273a12.3.2025.07.14.10.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 10:03:01 -0700 (PDT)
Message-ID: <2d9634db-3b2e-4f49-8206-8ce4c88701cc@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 22:32:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
References: <10ee301c-7549-4a97-8e74-45329737222a@oss.qualcomm.com>
 <a4b0a5d1-ec5a-4812-970c-018cf9c9f0a2@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a4b0a5d1-ec5a-4812-970c-018cf9c9f0a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEwNiBTYWx0ZWRfXwiu3ja9634LQ
 6jgmOe56UECK0f0UzrPdhzdmqQ8fx2tourVgqyRbp+ENfGKsFkme0P3jdEE1RbPhZKQtt822Sjy
 iHYOAbOmJ5MQklmKLbct+eF/+nwIhviKzL9dfmrpzjYa9GuopsA2tffqFsW/6tX6/tZswfqMOKD
 Vs1FlaKcQuyLPB3RRc8BFNDJ/8qCD2XcPEpZhDZ6C72GfO9RdRDHKCFQXvjJutOAG7Ogl8rzs2a
 CRusbuKKhzsKAfHKAxeMCGX0PvA3sfqh/kJ4r2zDh7GC4nZNUQkYPz4wu1d/lWH8OgpP4/1bYpg
 T4j+w9XiUjUs4gsgMyHJHyMNssmF54YBfP27Bmj4NI77biyf28azVaxSlbDsOOH4XWju9fNEHpW
 s3dX1EPA/I7jJWY9BBAwqhJpWdK6/9knivlIvL10BYdNu1+yDBesNzoXsSlXxu8EqiSubBvG
X-Proofpoint-GUID: oso9vmT5H9y3OZW0BhXNMzvjUCIaMdtl
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=68753848 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=J4hHMLXUlZdx2gNTs44xtA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=qC_FGOx9AAAA:8 a=omDgY6AHICL4hUqj3W4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: oso9vmT5H9y3OZW0BhXNMzvjUCIaMdtl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=728 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140106

On 7/14/2025 8:41 PM, Dmitry Baryshkov wrote:
> On 14/07/2025 18:00, Akhil P Oommen wrote:
>> Hi,
>>
>> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
>>
>> -Akhil
>>
>> ---
>> The following changes since commit
>> 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:
>>
>>    Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-
>> fw-QCS615v2
>>
>> for you to fetch changes up to 9e60f646cafc202d2a3613be7ee277e1a84c1cec:
>>
>>    qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 20:16:48
>> +0530)
>>
>> ----------------------------------------------------------------
>> Akhil P Oommen (1):
>>        qcom: Update gpu firmwares of QCS615 chipset
>>
>>   WHENCE                   |   3 +++
>>   qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
> 
> I think the consensus was to skip RGMU for now.

Yes, there was a consensus to dummy load the rgmu firmware for now, to
force userspace to always keep the rgmu firmware around. That way nobody
would complain about breaking backward compatibility when we really
implement rgmu support in future.

> 
>>   qcom/qcs615/a612_zap.mbn | Bin 14256 -> 2977 bytes
> 
> This file is broken. It's an HTML instead of an ELF.

:(. I might have messed up when I downloaded it from the internal
repository. Let me check this and get back.

-Akhil.

> 
>>   3 files changed, 3 insertions(+)
>>   create mode 100644 qcom/a612_rgmu.bin
> 
> 

