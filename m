Return-Path: <SRS0=iYdG=BC=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671BED58E7D
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Mar 2026 08:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DEE5C19423; Mon,  2 Mar 2026 08:32:16 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 457F9C2BC87
	for <linux-firmware@kernel.org>; Mon,  2 Mar 2026 08:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 457F9C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6228Gm473227146
	for <linux-firmware@kernel.org>; Mon, 2 Mar 2026 08:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	obDT2L9yI/xgnNJZbpV1IdmTOmyamaPnG4gAjF58JPg=; b=B08a+jAzMagQzoIJ
	+TNvef2ZUfSH+0eTIiqpJf7SF/9No1Q6qo7LVKkPf0OrNMAfzp0+u4TInN71Rz6M
	GAnQAWs/wb44a2Op2iARpwayc8JJTilfSYloAvstifsvKltmmfHzV43+KNf9PR3Q
	/B5nsq7PilZI/Jyz8vwbvlhurjaQ5npBysekDGy9AzIxQfec+d5WFligysXFGF5s
	NrzV1eL6T0qCfRE5XuRGhdJNiq/qY6IMXHau3hCmwsOktuI7oPKVhEUFoVzpcw10
	Juy6StdUbql6RnhXpyNoxk8paSbddtaRBJ26ad+7Rn0Pe8yZuU8iHL2ZOZGOD1/7
	NdLhyQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn0b1h9ym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 02 Mar 2026 08:32:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae4e20a414so40240925ad.3
        for <linux-firmware@kernel.org>; Mon, 02 Mar 2026 00:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772440333; x=1773045133; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=obDT2L9yI/xgnNJZbpV1IdmTOmyamaPnG4gAjF58JPg=;
        b=bItYdKO+VtRLAKtrI6z0XOiHuNhj57gV0XftwMaevxbq4QwDS3fgGe+G/BucCM/0bw
         bpm5gjuJMmtck5/Ki2YO0zu+TMTBoopYAXA8cs37MAyXMUacSvdA6TvKTBGSQ3T5OcXK
         mSe5dMLvuuX29QP3wpFiyAPciIMVstWp7AygEEhVHcxFXAZ95R7RL1tc2nE6IHK7AhBE
         A3KLlUit8w4kaDt+9UlDsqWHYn4WTONHstpNjXDRRHwa0IVdl5uGweoGtLl4Ve/wCvbJ
         As5XNZ5qS1+ggTZvG0zEMXC4xVACOYz1/gzPlF3Eda6lcKoJTdGvABlTV5Pew0TGuSYo
         mb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440333; x=1773045133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obDT2L9yI/xgnNJZbpV1IdmTOmyamaPnG4gAjF58JPg=;
        b=YBIlH7wnwt5mZKLdELCErIgys3jOmcVEYUHZlSWMqUTp+BkglG42mdBwoq6oWoILQ0
         FaH0TFK11qDotsv9Vi4Zp4hqMU/okGuHFF2hKlR2HbHNXvzZfXxMJZ07Bv0JW8BSI1SQ
         IJSR4/dmWFYX/ugsLaXset7zffDhP+NxpiMSb/olhGrCSu9c8hgBzj1kwrMDyU0VNWV/
         eMWSpxNe4sg5QlDbabyEirbcm8wPyhu5toC+MJAouYxrq+FJgdvXuJunNr+fxFl00qQ6
         xPfNlHm9TXFXGXEOrFhEUCvMuXgcL35eieiqnzJ6RMLdYaDm90Z4L0igddRKzfNSuehI
         Y/yg==
X-Gm-Message-State: AOJu0YxJL1orr20cqMwFQ32VKTboJyumc35jJ7luU5ksCa/OXXB4OK/E
	2Nv/DEqz2jZxrc4xbY8526QAdS80l2pKY6dtPOVfoCoRX2aun/XSEGMGOvlw93zuVL0G/WvYzNt
	VePXMZz9j4vmbJVgPr6aplTmxoXiWDdYuLgZ2IYXMr02AqF92m7vjFz4L/1nzTPw=
X-Gm-Gg: ATEYQzyYHR7jCeEpa/ErtW3j7wKzQq32aLZgAuOQR9IPtLD+FJfVeStZHyRNseQt+Yv
	rELIbtb08+RsEfdVL/DIeefqPQmD2EaNdU8HYmMLQxS2UTAM2StH6+fg+7+Q9+r2IZHL8UPWbll
	LxHqCCZ6fLJMT2osVLNNdYNF4xEOZesznjPvN/FaikpD2EbU4jJkT1mCZitIh4k3tGzb/W/1gBj
	v8ojBnJXq0FXUcZCYB9fH3q9OPzVRPpxR2Yg3TRKyOZUpOVkqXOtfgP01IzHtQ6WHBsoXCgO1d2
	AasloRjCsq6hexybZ5jd76PSqOnGZ+RNDU2XHSdV5wxKrqZs4JqAocv2sxy+xLLcxQu6qgOfdqc
	zgb1Or74dSkI+7G4JpxbZH3SrZN7Y+YitiOiHTrjbKV3lrZvjM4I=
X-Received: by 2002:a17:903:1a6f:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2ae59d32aa6mr4938015ad.19.1772440332888;
        Mon, 02 Mar 2026 00:32:12 -0800 (PST)
X-Received: by 2002:a17:903:1a6f:b0:2ae:59d3:27f8 with SMTP id d9443c01a7336-2ae59d32aa6mr4937705ad.19.1772440332375;
        Mon, 02 Mar 2026 00:32:12 -0800 (PST)
Received: from [10.204.86.153] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa801954sm11098576a12.22.2026.03.02.00.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:32:11 -0800 (PST)
Message-ID: <4c6945ef-e5c2-4d35-9be6-a304c66f7043@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:02:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update ADSP firmware for glymur platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
References: <3b89cf7c-2e22-4951-8811-ea646c00be53@oss.qualcomm.com>
 <kewyupqb3z6sh3jnuqzecigjx3is4mt26uc5wil5cybd7dzrtj@yaopwhgqdaoy>
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
In-Reply-To: <kewyupqb3z6sh3jnuqzecigjx3is4mt26uc5wil5cybd7dzrtj@yaopwhgqdaoy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: i9mEr4fi7DTNdadObSqDwf8RX-PBq4Kb
X-Authority-Analysis: v=2.4 cv=Hol72kTS c=1 sm=1 tr=0 ts=69a54b0d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=cGXIDumqAuS2zh2lOrsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: i9mEr4fi7DTNdadObSqDwf8RX-PBq4Kb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NCBTYWx0ZWRfX03runrU7+5+4
 3NJH9F4mFpqMM1nrvdmPR/FHIM2/I4JSPnGOZHmWZry7pxEMcK36L/AygaUJbu7imBXuq8pmcIK
 FKRWhsRo7Uv25XSvSKDYkxI1pybQkk2W887DHG4Pb0N/fUuVW20IT1ItlRUaM+Qi/t7ZykYjRl1
 vVKuoOZMeNeyHQQvY6sPP8qhwEB7Ld9+cDcLZjcIhmxcK6YMC9MS0wJ0T7od43jZUF829gnxyox
 RN9IDK4PakWowdWNY4uIOcAmyWrJGYVPN/exZRwGrU6FX50O6+WvnMrMxksOjr7xhAmY5vwu32i
 Ni4j8AylTgJwniS/w2xEOLDdzKuC+v/jzNPRWBnGYoH66ZUJaOFHYT3wMPu+MiRt545NtJKepWA
 zfxgoYBza3jhP2OmOqsVI7qgr8VezGNxNE3MjIpnqP2Effa0mzXpZeb3spvKqvGGDXpgx9vJ2X3
 KxnRk+YoHuRVzyS99ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020074

We observed a bootup failure in Glymur caused by a corrupted 
adsp_dtb.mbn file. The corruption occurred during the ELF → MBN rename 
process while upstreaming. This PR includes the corrected adsp_dtb.mbn 
to resolve the issue
On 3/2/2026 12:38 PM, Dmitry Baryshkov wrote:
> Missing commit message. Please explain, what is going on, why you are
> updating only the dtb.mbn file.

