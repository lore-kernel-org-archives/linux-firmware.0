Return-Path: <SRS0=IQ9Z=5F=oss.qualcomm.com=kishore.batta@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01BDCCD1BF
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Oct 2025 08:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 699A1C4CEFF; Tue, 28 Oct 2025 08:55:36 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8036EC4CEE7
	for <linux-firmware@kernel.org>; Tue, 28 Oct 2025 08:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8036EC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S7dV0l1032894
	for <linux-firmware@kernel.org>; Tue, 28 Oct 2025 08:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pxYDce0MjPhrPTVa0VpLjGoAbgRoRK2B1pvOH8Rto2w=; b=dzH5Lm7RPjGbVB8Z
	wkmpcWw6KXJ1BO2Y8yLYf1VqPGyLVOFeqX+9wAEswgVGlvZJJqYVUcsqWY2eYtFc
	+isRWjn0laueleWXk3vWnzGVlJU1uvKbU04JNyc1HPxl6GztyPZQwfGTFVW6RoEr
	Klg5wrQCwhCI+0a7HGpUA28wTXKSh4F5E/Tt8m1P+n+poRZ3C++Fkl8OOQja/PKQ
	hp4WtwyNUZz+2bHjJ6jLvWrxEGuqCDhs6WsdsroJaXtmV/V+HcoVapyrSBz9COqS
	LbZQ/pyrUTv9zLpjPZOHAdSugusc30ITBT8KY7Cj6NLId6Y6Gx+Y1kyRE+/u2f1p
	ASPZIQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2smur7jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 28 Oct 2025 08:55:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2930e2e8e7fso47065925ad.2
        for <linux-firmware@kernel.org>; Tue, 28 Oct 2025 01:55:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761641733; x=1762246533;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pxYDce0MjPhrPTVa0VpLjGoAbgRoRK2B1pvOH8Rto2w=;
        b=j7m835TKnRYo+1csqgZtRfMOLzyHDGAnllK57d9y62g3eevW24uSPPiWvLXC+EUeqw
         RnnPmZBTm3QQAeETOdO2UWutGkE+C2MTLJ0VsKxeaPB/YeyH1ICsSKyppe+XUivzRYBg
         1Gz0zzmmma+7XtE/YpOpn+GEmdEaUg0/iQme2DHRN7zEKChEx+eXhGSaSNevRp/2FMPj
         Ecfoe9IyTLOSJitEqLDehrl5l/YCFic9GN0fMAdgrd6nHGNiaaJIFnriwql1hJzovD0F
         cHA5gLm/vAAA1piFDGi4Kg0CmHeBcmUvTkw+Ee3D7JSxeAD14BMXOdCwEb5utg3tMHOg
         og/Q==
X-Gm-Message-State: AOJu0YxFswfz5E8J1QFcwxm8H7gj48sAOfh9zgu55h7MryvBbDeS4vFV
	uefKdtNzX9u5mXEy4lmzjSET0YhRwa0YVhpcNo7xF63vgwSLZJ5tXcmkDOTC1j8a72CPmgFeuAr
	4QF6tsWIADqt/OBPRZDrF4oZf/EcrSwBarOmi+G4t5wt8WMnWzDKMGXe7tezOwf4=
X-Gm-Gg: ASbGnctXXY6ZNM5vFqAxY7VayWKgwB9ubs7x8ezCUjM3jYkh5oc7aU7PWOsBiejO3U8
	uw6yijA5P+qQVz6Lf0+0y9Rxia8V1deqt2CDS1sdhTpE4fbwFoVrANcmfzCWQzAo1yT2B8CKnsf
	VELm2BQ12JUz1kDXmkiD+Ec/juoOVOVcR5j+D4Lec7m5Gvl1Qx5ylmj8IKwjit4wQrkwiVRi3n/
	cKL0EVBCOHC46++AeARSHFQbSb+IuK/prbYDyL6irA2dYJkv1FeXZczVLRrY6wSeQE/boD4Zj5R
	r8Th60yJtzlmf9wYviuntHjpgRuaVaXgAviA5X3LhlhKHrysSYALe5+fUmsOXeC0SNZDThYF4Eo
	lrdJrUNf+78D7+Y2dWvkahTusqKfVkHc=
X-Received: by 2002:a17:903:1666:b0:276:76e1:2e84 with SMTP id d9443c01a7336-294cb37b7dfmr39967365ad.3.1761641733337;
        Tue, 28 Oct 2025 01:55:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErgujnOh9jTd/xdJF/0YVgIkKMQCEv5OCbJRVCjoeDYJbtSlChjZIQqDtdms2lrkxYYyRyAw==
X-Received: by 2002:a17:903:1666:b0:276:76e1:2e84 with SMTP id d9443c01a7336-294cb37b7dfmr39967015ad.3.1761641732866;
        Tue, 28 Oct 2025 01:55:32 -0700 (PDT)
Received: from [10.217.219.169] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf4a40sm110946835ad.0.2025.10.28.01.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 01:55:32 -0700 (PDT)
Message-ID: <e8ef97f3-8f2d-475f-a283-2e39b8effa32@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 14:25:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL]: Revert QDU100 firmware binaries
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <9d96eedd-c1de-488e-ac5a-d515d8d3563b@oss.qualcomm.com>
 <76de8198-d219-443c-9283-2811ab338c17@oss.qualcomm.com>
 <CA+5PVA5sjP5a9Jr3=5E5vM=jGP3JcA5ELKLuxd4JSVzG8avKdg@mail.gmail.com>
 <b3a1d843-6e64-4573-8afd-edb10ab8e86e@oss.qualcomm.com>
Content-Language: en-US
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
In-Reply-To: <b3a1d843-6e64-4573-8afd-edb10ab8e86e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: omF4jZBGDgTSAs3TIzsHJHPKzxixVxPv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA3NSBTYWx0ZWRfXzhgX8rG2M6UA
 lC0grhKulxyB2JFzP4sXxz12SEnpCzLSTPkr8uHtZswmoqCYYh2Sm9iVxOk1c/OL3uiZL1MrYsE
 BdXcvgwU1ozmEUYH09leHEetfD9cMgctqYX1uuLziwamhmE6UH/QB06fUz5rdXyZt4tXmFvlPZf
 /EO57dBE+SnJlTq99jPSzssfItU8KUpWFEb/azLEpk9nzR6LRe+13l+FwtbUqNRJ+2iFiZPIVd9
 7uLWFZRqXsg5HbY4uQmwqK46gp3BHoCq1jutDOmFYWwrdNy4bjwNHwxBYz7mp8UvEO7lTz6g4Ga
 PSQlQsMuYE8o8b/nn3HjAyA/t58MSzXWNv7svzX1wzcK4mxTGYMiIXlTHlmFhe1UOYWpdsljnn2
 alIyIEPPhDfVea0XSM67B1WLeJseaA==
X-Authority-Analysis: v=2.4 cv=IcCKmGqa c=1 sm=1 tr=0 ts=69008506 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=vZuFnrfr1LfqNwuzC58A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: omF4jZBGDgTSAs3TIzsHJHPKzxixVxPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280075


On 10/25/2025 5:22 AM, Dmitry Baryshkov wrote:
> On 24/10/2025 19:24, Josh Boyer wrote:
>> On Fri, Oct 24, 2025 at 5:49 AM Kishore Batta
>> <kishore.batta@oss.qualcomm.com> wrote:
>>>
>>> Hi,
>>>
>>> This is an updated pull request to reflect a corrected commit message.
>>>
>>> The following changes since commit 
>>> 19731a36222e7b1ca09be090a19bfd89640a837f:
>>>
>>>     Merge branch 'HP_Linux_Firmware_20251023' into 'main' (2025-10-23
>>> 13:30:10 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>> https://github.com/kishorebatta-ossqcom/del_linux_firmware.git
>>> del_firmware
>>
>> We can merge this, but the firmware is already released and included
>> in a number of distributions.  Deleting it in the upstream repo isn't
>> going to remediate the license situation.
>>
>> Which platforms is this going to break and how will it show up to the 
>> user?
> It will only break the QDU100 platform. I don't know the spread of the 
> device, but it is a 5G RAN platform, so it'd not a widespread device.
>
> Nevertheless, I don't think that just deleting the firmware is a 
> proper solution for the situation.
>
We are checking with LOST team internally. I will get back on this soon.
