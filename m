Return-Path: <SRS0=JFja=C2=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE65FF8861
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Apr 2026 10:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B99A6C2BCB6; Mon, 27 Apr 2026 10:13:34 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC2F1C2BCB4
	for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 10:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC2F1C2BCB4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TLnu4054899
	for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 10:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4CFtxYnA3aTOuL5VrppPPckTrLKyAtNWFnMf3ALlSOA=; b=cz3H3TmosyUACDMd
	7XPU8h/otSGkLQ6I3ME3vTJNa1R5lo2lWSk/eFFX/FBskRBAg6611J87HVCScC6R
	KawBJ7pZ551/P+F2ZmH7yWbbsOJK8zccE0manXSFo2+SNTbOkEan9j7vP9j1s6KG
	axABA7i6jeWbNG4p6VjBc68wAo9kK0wMATkw2YjGRGoGL72ZtXMLULuU+BQg5f7V
	VLHOL7u/uLTLig13a9YxGPaCGkq9llSktEpnkf6+CUgLsERr32/CIf8n+ds0l5R3
	zQKAy8OcZoc0fpRXvEtK33kXEKTA8NA3nt7cCVrlQWeWm6V8kol31jzP543fhjwA
	RKm+uw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnkxdmm7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 10:13:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c7977177675so5103871a12.0
        for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 03:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284811; x=1777889611; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4CFtxYnA3aTOuL5VrppPPckTrLKyAtNWFnMf3ALlSOA=;
        b=JQwRK9Dml4+guOOT/GXzQCdpQjx1Blx7J8PDYMzof5G1r5tR1w08ATpVwpPqblucgN
         lk7Vr+6ZR0p4VznXoEQE2N4Udc2+dkZEptxD1liZ3MlEb9aKajsau3ay3rGBsSVH0xdb
         iQfGetM1uYX/AEURKVTqAGX7bX60IItAGDudpKmeSm4m29xTS2XRQdMhyQKNXzuJYhxO
         DwQQg/ofUokqNKnVaJYHn0U0G5DdjMZXwe+k6OIb/rb1/8C/JpeGd24m6M6H930XDdAz
         +OupK1bAZxQxpjwPNoiZ+EuaQ0uRO2g2ibce3qKYXSE6CT/0wi6y9vowZKzwSjUj7vkV
         +7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284811; x=1777889611;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CFtxYnA3aTOuL5VrppPPckTrLKyAtNWFnMf3ALlSOA=;
        b=sIlJJj6Okfs1otxbBMHK960Oy/K/WoydP9x5dUgiyGo0ttrhNgfbtGvHGxvKeNHGwh
         RM5PIVWr1bbAS93vfwOz+CJGaidXa3ypEe8WcSKvdh2Hor97P9OoqXDagIl6m8B3nfW6
         24gmJ3NasKw6tDTpbnMf3I2YPxMuPYdFsJiZXLN1REckKZKj9kE5myRBIM2Yt6cJErLr
         SJCy8JK3lDKbEDjWBAiFdlDVtJTQGJ4fET7LwI78FsEDh1hU3rsUfWwczUFYnSnXY3dE
         y3Nn6IQ2Ou9Zhg584Wsg8i2sRWZw4nYrzfpdCTJFAM6GhTFVX/B+IiFI2gaBH92xCPm4
         9Alw==
X-Gm-Message-State: AOJu0YxlVOMKPuUj/PBG1WYh+u7n22uwwwCyfMCrls4dNH0ZT/xUa0br
	wjEbxhY45cFZuXRNxzzTUbsMPQb4XHO2Bru5u6/koAytSQGJlWULlpRy+HRi8ES+yMDq1UcANgO
	WQc0jKKOF95YojQEHzAqGDLmKktJDIyuQCQ1xiJJRiixlMytI11K9oVCo4dTUnICwd4Liusc=
X-Gm-Gg: AeBDieul9eHtTN+4kugYjxVjEjyYuIZF4zuORX4dlBg9eZvQmMLbtQzaKdkV20DZKjH
	zp3UI1Q3sJ8L+GAucRQhTzpECcfOE2m4xHuo9dWuccTtM2/sEdt4U3e8I/GK4P2sXS4L1+rwT4c
	PEOVlKmHGlCkz8xHd6aqS1rL0EdIALRzMbvnMKLOxUnde0ZpbfJ4aXdOV6RmL6VipmeDnhBeu5M
	X9sTanXm5PQaeLxKhYJ1wtg/Sp0GzcMnh2VKk16EPQ+bB/4dtAvTGc+GFof6sZ+QdOKCGjoNrb6
	Z6n8nQKK+bOrEHYMzEdpW6NsIYi1Kziko2CtPrRtDlJCJc3N8gGmLz8+wcxcyMKn81XZQWVL8JH
	a/0t574vGO1gRukt22Z8m8j/6dA7wqZA432g9Mn5wn+CcPhptM0SCAYdr0V2e4tR6
X-Received: by 2002:a05:6a21:9984:b0:398:837a:7af0 with SMTP id adf61e73a8af0-3a08d8a6589mr46075777637.30.1777284811280;
        Mon, 27 Apr 2026 03:13:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:9984:b0:398:837a:7af0 with SMTP id adf61e73a8af0-3a08d8a6589mr46075747637.30.1777284810799;
        Mon, 27 Apr 2026 03:13:30 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.231.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7991ca66dasm17868239a12.26.2026.04.27.03.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:13:30 -0700 (PDT)
Message-ID: <2188dbb0-e8f9-1ae2-2987-8185276d1e1f@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:43:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: qcom: vpu: add Gen2 firmware binary for Agatti
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
References: <dc0e70be-70ff-8638-5a9b-9fedb7a6aaa8@oss.qualcomm.com>
In-Reply-To: <dc0e70be-70ff-8638-5a9b-9fedb7a6aaa8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KEr2BFGiqgfx0INVfBlSThtS9Jh3L18C
X-Proofpoint-ORIG-GUID: KEr2BFGiqgfx0INVfBlSThtS9Jh3L18C
X-Authority-Analysis: v=2.4 cv=TuPWQjXh c=1 sm=1 tr=0 ts=69ef36cc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IsmkTJhEuG6GyfueqI04Wg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=qC_FGOx9AAAA:8 a=7LM7--kuRd4a6WcPn9gA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfX+hreVvnqAEbx
 ddZ+sA2mcUFsCj/i7j2DhlZ5o4U4vd7pxI1uxOqBglqSkKbmGFYmA5g4FvPPXE7dI57rr1oGfAH
 p6hpTYoZMQhLCzAnNKee3ftprYH5/VgRDvQNBmttAXbIdrmRWKyxO4uRhT+EWGi+dLBoZeKQeYg
 eWGBTiX68waB4YJ1+g4CSn1f+E+CIaEdkBdGwLzIFiEEuHBEiP1ycBJ60kUPB7O8VvJx3xt/ghO
 YzP2yqV1mHEsRylhqPdYZ8xEVpzF0K5xUkCPeY29cZH3DWUjAVb882lK+maOfpyLXgp7Hm6I5U2
 qflbNAA+RijfefzVHI2Cys5BxIOqHjy4im+fqhAMObrWasP/VeKGLCdifsdklpwn7NFcA7H6/ag
 m0NoV8LjNPGPqdupkDCMg4TdBUuFgRvaWUmyWLc3OvSRU46hRI2SJTu1lUQsTDvmj5fuJWm+s1U
 C+n489JjtZ9yjLLyT8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270108

Hi,

Please ignore this request, some change was missed in this.
I would raise another PR. Sorry for spam.

Thanks,
Dikshita

On 4/27/2026 3:30 PM, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:
> 
>   Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-Agatti-Gen2
> 
> for you to fetch changes up to 0d5d45c00868c21cc5cd1d21adf8afd7a73a91ef:
> 
>   qcom: vpu: add Gen2 firmware binary for Agatti (2026-04-24 15:24:14 +0530)
> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: add Gen2 firmware binary for Agatti
> 
>  WHENCE                         |   4 ++++
>  qcom/vpu/ar50lt_p1_gen2_s6.mbn | Bin 0 -> 1861732 bytes
>  2 files changed, 4 insertions(+)
>  create mode 100644 qcom/vpu/ar50lt_p1_gen2_s6.mbn
> 
> 
> Thanks,
> Dikshita
