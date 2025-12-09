Return-Path: <SRS0=tmI4=6P=oss.qualcomm.com=renjiang.han@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B460BD3B7EA
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Dec 2025 02:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 830A1C113D0; Tue,  9 Dec 2025 02:18:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82093C4CEF1
	for <linux-firmware@kernel.org>; Tue,  9 Dec 2025 02:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82093C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8NXCJp1853438
	for <linux-firmware@kernel.org>; Tue, 9 Dec 2025 02:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uP/2zjivvUgnb321X9NZ2eIwqULWIsW5VQSNftF+3Gs=; b=IlE+R6zx72+QV6Ay
	gGxIJTOGGeHrsoBec9AVnWVbdWjYQqs0NXyKIq19LL6JFD5DQaSoRqBYkQV5yIpd
	1r6V3JyOkInqtu0+rXArTqrKycs0Ep7jMeJ8V+cH1RB2EWksUjjLyAI58nBmt+9y
	oPX7oWEIw+MrdKHjHxP+F/6Xl4a5NRfn2no6xz/1TCYoOM3rB4Qr4EqrfMOjaUTv
	oHU2dWKhroDpV2rnckmBF/pT92xBkxVckU3pYZmgmSmGI/fRvwmPBKv2wXVDQ5es
	rFA5z2PFTJs94JrPERSAQ2pqkQ6cszKGTLmacqHmzoYqt1SStDv17zRF/U5CUosg
	ETYfZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax63v8pw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 09 Dec 2025 02:18:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29846a9efa5so92217505ad.0
        for <linux-firmware@kernel.org>; Mon, 08 Dec 2025 18:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765246734; x=1765851534; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uP/2zjivvUgnb321X9NZ2eIwqULWIsW5VQSNftF+3Gs=;
        b=TkqOfxV5J8w5Bf0rWw1HwtZRT/lbKQFrNbZP/JnWnI59+LKDpFIiBDj7tJzp3S8KAI
         ge+KIT1kD9oltXWQqFymwBuM/J0bojXobbrGIOj8QYV4IrXnGCXg4H51xdjTrfPATzEz
         V0XTA0klyDTIxLN9ze4kCJTdojDmD+YlSBYCiv+s0K7AFqheeJqeEvk8vKMWNnsyq0WE
         jHf59ATUravXQ1ZU9/NZNxGvhEY1ANs2Ot6doQe4F1dx+ghYDerriIDj+IfPTMsmOoTx
         kJQO4mo/aIP3X/QiainBar4gH1x1zA9DAPfB2waq7WsavDSB+H6zfxPSpgpdgOV4Ry9V
         hOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765246734; x=1765851534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uP/2zjivvUgnb321X9NZ2eIwqULWIsW5VQSNftF+3Gs=;
        b=qdOLPXiDU0YTOATbt08dn0StHJdJWUsvWRO5iUKKgwRWq96H1WwXxp4as0LNJA5s2u
         wYxfZOZrMPmtrgRSc2AZWjDZSYbVQ5FJoewi7F1fkWYlbziNvuddE+bwJ2xlgaiOM+EC
         O21bvikqBrjoiJRdaw/yzkKn4f1suX4ol5kcB2VWlDWDe52q+HV8LAfgaAnm0OlaAavq
         MSaJgQkWypZCuzOZUyLToUO/tmgcIPQsGvf6LHxSGByUhARhRASLW9PK01gRhTSv1+8w
         rs9ufA1tb1PEprP2nK//l2JNkNkek4kD0ugnCmmqhxSS319ctHC4U03LwcTYyNuaoPQV
         S/ug==
X-Gm-Message-State: AOJu0YyYa1ZVmyuOUPEp6CJTqnl19pvSJ4rLIv05CDpyje7nwoUur9jA
	Iy9yXAILeALmMAvZgIp2mDX+ZRq++SCa0xaVVPQlYAmV8o6IxK8aqa9vkfZh6DV8Cf+C9V7q611
	hTHM5vVF3r7+tuk+G7qiFv0gsKIunuvPYySpfT7uVztvYKA3CaBGamQCjzZQe0W4=
X-Gm-Gg: ASbGncuZj5LA60r0/rkwga7wBr29ajC9zcxlSxBe40V/CNPYoMy67gnSyOAKSdnRVL2
	dtKrBDg52dajx8aiLb7kBf43xU/HtoO0kFphJskzs78MYsD+5LGi2pzm5PwauCwWHbwoxe3rxs+
	iN/fn32xh1TI29x7Lsyq/UiSAJKOmyLoF1wmvxvO4A2K8PGhr2obretlCeQdNd7N0zyw3+sHBNv
	G22RzUy0UXzfwLgNsLIpZtXN5x/miTk5Eb6TeDhKuSUHJZ0qEdvR537skVEEsVXg57TRHiiO2N/
	fGOGEPLGiRgJuz+WM9KafkbvXp24J7ULn5CnVRYxXmf2gNbu5kDX+bgYEfuHB71j2kgQESYvFt5
	QeoZRG0m7GVioeUyMJbRS6Y6YjELj+PIEEFkxd30kFZQs2iGLWFX8Csk+AUVf+DcokbOxPAFbdu
	0aW7+gyA==
X-Received: by 2002:a17:903:354b:b0:29d:73cc:c9e8 with SMTP id d9443c01a7336-29df5275563mr78543165ad.2.1765246733940;
        Mon, 08 Dec 2025 18:18:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/Xce+qZ/bHf5kRFNH7mncluz2sikhOI6ceIpSI4i6G6QU/mPFSPzXfhZSBh0ncPE12Ju0Uw==
X-Received: by 2002:a17:903:354b:b0:29d:73cc:c9e8 with SMTP id d9443c01a7336-29df5275563mr78542935ad.2.1765246733341;
        Mon, 08 Dec 2025 18:18:53 -0800 (PST)
Received: from [10.133.33.217] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4cf863sm139315355ad.38.2025.12.08.18.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 18:18:52 -0800 (PST)
Message-ID: <023b77f4-8b8b-4e3c-8c0d-d90ba3cd5d57@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 10:18:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: update firmware binary for v5.4
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
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
 <2b7be357-3a11-4eb7-ab6d-fb58c7909b07@oss.qualcomm.com>
 <lllpl7faucz7b7fz5kkehllezjaefplayzrt66bvvyq3e5sym6@katcv5fgx42h>
Content-Language: en-US
From: Renjiang Han <renjiang.han@oss.qualcomm.com>
In-Reply-To: <lllpl7faucz7b7fz5kkehllezjaefplayzrt66bvvyq3e5sym6@katcv5fgx42h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dKarWeZb c=1 sm=1 tr=0 ts=6937870e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=PfV__68ZEWV5eS1QBjkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: xD58KwvwUfQjbms-N-wQGHgkVeYqJzzt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAxNSBTYWx0ZWRfXyF/TP6MU+eMA
 xqo1UdupcNHno0yQdOWqukj45DSdgCOU+Z/Y6U6DHB/9mKGI/O6Kaz9hN/xzyPTme85kRvPWo7V
 0fRgEVRzfj53Pqji6nhLIA4CUvCebOoCibWYiTJfqPs3SVouEq08aWPLn1MWA63PUHebAY1YzxC
 0bqPXK7Do8SUHOuFPW4YiguHjKyC4pc4XAT7aitIJ/gs27oI/cLttCns3KTwfgRMRSQlfcff4IT
 ZaGlGPc0McnOK99WtK4e5cVxOLVUXFC8b5F4ChRUs5/cgG12m8SSQkrVC0LEWi5fXr7v8/Kl3bz
 8BAOOYjCb/yGnPw43kAjhb+Tc+RiCSRG4tUzFQ/tAAdIEr7EFNae92e1XJW2o7M741hXSoE5X3h
 ZcZ7qdAfDl3eyKKlQ6sJ5Pb+tEp4fg==
X-Proofpoint-GUID: xD58KwvwUfQjbms-N-wQGHgkVeYqJzzt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090015


On 11/21/2025 7:55 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 21, 2025 at 03:17:24PM +0530, Vikash Garodia wrote:
>> On 11/21/2025 9:27 AM, Renjiang Han wrote:
>>> Hi Dmitry & Vikash
>>>
>>> I have re-submitted two changes, please help check. Thanks!
>>>
>>> The following changes since commit
>>> 6fc940781a013ad837ed8fea326d2b897467bbc3:
>>>
>>>     Merge branch 'robot/patch-0-1762826844' into 'main' (2025-11-11
>>> 12:02:02 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>> https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git update-
>>> video-fw-v5.4
>>>
>>> for you to fetch changes up to bb28dcbcf9867ebeda6a41d575656a737c24f32f:
>>>
>>>     qcom: venus-5.4: update firmware binary for v5.4 (2025-11-21 08:55:41
>>> +0530)
>>>
>>> ----------------------------------------------------------------
>>> Renjiang Han (2):
>>>         qcom: venus-5.4: remove unused firmware file
>>>         qcom: venus-5.4: update firmware binary for v5.4
>>>
>>>    WHENCE                      |   6 +-----
>>>    qcom/venus-5.4/venus.mbn    | Bin 922216 -> 922312 bytes
>>>    qcom/venus-5.4/venus_s2.mbn | Bin 919008 -> 0 bytes
>>>    3 files changed, 1 insertion(+), 5 deletions(-)
>>>    delete mode 100644 qcom/venus-5.4/venus_s2.mbn
>> It was made quite clear to put up the history from versions #58 all the way
>> to #62 in the commit message, still i see commit message does not capture
>> it.
> No, it's not required to capture old history. But it would be nice to
> point out the reasons for the change (conformance to ELF ABI). BTW: what
> is the actual alignment requirement for those segments? E.g. on ARM
> systems code segment must be alisnged at least to 0x4. Likewise data
> segments also should have some alignemnt (again, 0x4 at least, usually
> 0x8 or ox10), otherwise loading data from those segments becomes very
> unefficient.
Correct,the data segment needs to have proper alignment. However,
the alignment value must comply with the ELF specification, which
requires that (Offset % Alignment) equals (Virtual Address % Alignment).
After we discussion and verification, we decided to use 0x4 alignment.
So I will update new binary with 0x4 alignment.
Thank you very much for your comment.

-- 
Best regards,
Renjiang Han

