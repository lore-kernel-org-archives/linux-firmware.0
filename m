Return-Path: <SRS0=UKBN=5M=oss.qualcomm.com=zijun.hu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2F1CCF9E3
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Nov 2025 07:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A34DC116B1; Tue,  4 Nov 2025 07:13:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 497C7C4CEF7
	for <linux-firmware@kernel.org>; Tue,  4 Nov 2025 07:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 497C7C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A42ej983682846
	for <linux-firmware@kernel.org>; Tue, 4 Nov 2025 07:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FBUamqlXZNysp1J2fnaHPL+jmApd6O1y/oFmFUFOlE=; b=cRW94E/J7XxupV9y
	zpcUICp/alDnl+PPhOfr6CqdHrgULu8u96c1LWXkZPBkOpACXkxANhR2AkE2WyBU
	kMOr4P5pTZUQwRH4LPGYCIaf/rYCnGHN2pjxxEW3a26apDquuVFVZekjdIFx4Vjt
	o0tqBKE5zDggb84LejnIYPZqEAalBICk4lNLqaIAftx0EnEriOmpPccgzfthpB+F
	bMyusLgUVmYSektXM+L7ukFJl6mBR4WZusambrro8DK15EUm1VyBQrfHs8DKONoV
	kPIJHCNTOGOo/s8Erw6QZKMUpASERzoU/sRO8njTtFvrVc4WaF0UirgaFjZsAnuq
	4O8zXA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6xjqtfm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 04 Nov 2025 07:13:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29558b13bb9so6945255ad.0
        for <linux-firmware@kernel.org>; Mon, 03 Nov 2025 23:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762240399; x=1762845199; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FBUamqlXZNysp1J2fnaHPL+jmApd6O1y/oFmFUFOlE=;
        b=XnEW2YgNt/GV6MR8UtDAOJArrpnB/+X6adZY8ksEjP6A4/ieVxCLqsYLdRTz2jaR/l
         QDvh2kSrlQC7kULeGqF29M3AJIE7zaF1dF5E1PKJHeaS+i1lYjiKkTCVKjU7E10q5QLm
         9eBngSwx/Hnib+oINBvWJ+FuHzZDTfkInSC4JNofSu+B9kL0Cdu6ABQsc/vpaRHqYNiw
         XhIwvBMMPD6kwvS1RVolPloC+HBbrATDbm9HQ12THmOQ6mTsgLisZrZugXXFi11PwvPD
         jSBIl7xcW5LAJmXLtgqqsYHp/zLThuAIMQVZmrSwB/oi0rldfzliFhagKQt1C8M0wTHl
         z59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762240399; x=1762845199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FBUamqlXZNysp1J2fnaHPL+jmApd6O1y/oFmFUFOlE=;
        b=WxbXAOdMCgb3M7aVZZnrhNdLXaIV68o6oHT2dNS5ZYt9IsbDvqs87LYZRsO5isakZY
         M+EOTVwDQmOzX7ZVsmtWTIjmAUVvqHsFD69qty46FYSmB3e/VmD97Li0wu1950uAD+fZ
         1w4k1FEmSoIjSk2YTSnG3v3h+LNfl0KY2yoID0wWPP6OeE4LU3AUocMUjhFW+3J5sdh3
         9lS+p2eSjVWOEWO5PK+tie76hs3Q9aoD/y6dM62zzWtLQkADLssWcP2Pcgugyl5qaUoB
         B732qy9weBPhkZGwhGbE9qsU2VHdHA8lddmsNDjMb+ZliqEpj4j3sc4qIEpYPhfVQIDz
         G/rg==
X-Gm-Message-State: AOJu0YwAU9sBxmHmVcG7gYnYfMnxSzJxzs97llfVebckpY8ydRkkHaip
	7dVXk0LeodG7g29o4HZYDJLY+MAd0qFE4187Kh1Qp//NQg9bhMXJ9m5J1G6E/JqDnw+pfKZ42Vi
	IAJAafW/gPj851LQSzeZIsb+UTYaCePVjnfooCKCjMlM9qrmUtfVKXgJKvrso2YHpkay9hXQ=
X-Gm-Gg: ASbGnctC6RoUrAH44C4iSZ8BmJkzCYr+bq5fKRQBVu1gEy4MdLc+ls99aGrG37xpprQ
	jVPz2ReodNFCz/A3rwUxtYf/bEMyfg/zvvlcsQYAIssqxgmtMANZWm2TuAYMbgUKCKQcbNzqWDw
	MeLqGXtWcJrJXm4O04WrA8qh3/apWpQTbcZgU15IlQJYPM+8dhwt+lndhtwrfuht835MYIp3YvE
	ATem8uX/t/znGwt8O9ZnsUtutkgjoI80xo+Qetf5Mbsqx2vEQ2p0+SpwrRbsmcBJ8pbMpghW3vK
	+yPG7mZd0sO3ZHm+SAscY8qh4DjJWsYlP0/0Oogs3jwN5snU0oMHabnoP17R9uKQj7YHyvfgGjg
	dQ2ulvHFWQARcPRDDepDGMAfDbEd9TkQuhUKS8cKkvHfXt9PWSpJg+C9SZTtUvxvS3w==
X-Received: by 2002:a17:902:ec87:b0:295:8da5:c633 with SMTP id d9443c01a7336-2958da5cad3mr61944565ad.10.1762240398895;
        Mon, 03 Nov 2025 23:13:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhoXmfaxfyaR/ClsxR/nt9qZmqqkMsGRosHT5nJlwGvdNvr3MTIF/EU7yBD5V2QILXS/XSAg==
X-Received: by 2002:a17:902:ec87:b0:295:8da5:c633 with SMTP id d9443c01a7336-2958da5cad3mr61944365ad.10.1762240398406;
        Mon, 03 Nov 2025 23:13:18 -0800 (PST)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a381e2sm14811545ad.69.2025.11.03.23.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 23:13:17 -0800 (PST)
Message-ID: <20c1fdda-e015-47f0-810c-34dca4274575@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 15:13:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Bluetooth: QCA_BTUART: Separate firmware between
 WCN6855 and QCA2066
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
References: <aa746f58-c004-48ea-ad75-59813f3c3252@oss.qualcomm.com>
 <CAO9ioeXxv4+68Mf2Li1YKmme75t1EstO9EwGd+RYt1WT9cZ72Q@mail.gmail.com>
 <d69544f0-8db1-4a6b-9cdb-180b9cd96c50@oss.qualcomm.com>
 <CAO9ioeVXeCBAzbKYhoKNHL63HOtbxAyM71WncAy32Rrp2xR6eg@mail.gmail.com>
Content-Language: en-US
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVXeCBAzbKYhoKNHL63HOtbxAyM71WncAy32Rrp2xR6eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: igkOAsLboUiE3qsgxyTYGHBEflhiu46O
X-Proofpoint-ORIG-GUID: igkOAsLboUiE3qsgxyTYGHBEflhiu46O
X-Authority-Analysis: v=2.4 cv=criWUl4i c=1 sm=1 tr=0 ts=6909a790 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=zZD_XhxoHs9p-kdhMxsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA1OCBTYWx0ZWRfXwxQrBiBJ3WCM
 nrtrCSbkP6bORQrti7eyqWVyWdfHmIb7Jk/WDh61rOH4bUL6AQaNbCH9nyejQu1NeEq6sX9nlcf
 0i4R52ZIbdmyoevNVS9sxcTY5SLNzyXkOaz7E9CwGCSePFOBajWWyo1O7Q+6JJCKQz6Nleltt8+
 C6op3vSVzqU/be6XVLwOmTjpFCkLiKl5VqbYMn7LKqSK7DmYC40/swbxCkTOcd6x7RK2RMrTMEz
 6osdFw6yudWnE15VMreSju8oY2Yyze8hx5vYEzTDDDHB+thzbFRD2LDejuVJqRm9F0XMHeGa5gg
 9fMPfvEomnLDX8kZDGEujcoobebaRCexSyVmxgYv4R0zSNQLTdEFgMvwuuFGCK78CrJCoL39SbR
 Nc48mGfrNAE3t8kdzYgDeJw9jJHZ0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040058

On 10/31/2025 9:36 PM, Dmitry Baryshkov wrote:
>> Customer did not up-stream QCA2066 DTS and also not specified firmware path
>> in their down-stream DT blueooth node.
>>
>> Will change QCA bluetooth driver to change the default directory to download
>> QCA2066 firmware from qca/ to qca/QCA2066.
> I'm sorry, it doesn't work that way. People might be using
> linux-fimrware even without upstreaming DT. If existing firmware
> worked for QCA2066 and WCN6855, then the firmware with the same path
> must continue to work in future. If you are adding new firmware which
> breaks this compatibility, then _it_ should go to some other place or
> use a different filename, not the other way around. The driver should
> also be able to fallback from the "new" location to the old one.
>

got it, thank you. 
>> Will do above change after next linux-firmware release containing this change.
>>
>> thank you for change review.

