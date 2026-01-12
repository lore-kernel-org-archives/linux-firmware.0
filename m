Return-Path: <SRS0=WwDY=7R=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC42DD25030
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 06:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 946E4C19423; Mon, 12 Jan 2026 06:09:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7343BC116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7343BC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BD06UQ1974535
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xh6TglTWfZdLP/kUy+grIeHYtilAn4T6Jx/ftoMhjBw=; b=KiZFi65p2++ntMJo
	v0GzCPxICEhdXAgtQLrRqxVfHnaM5BNXnPc3zAUfc2sbE9oKzhqYr+FwVWO6NveZ
	vJKhubCoy82IR6YK+CAo8WrRSXh6YN3o2MzRZR+312oTxM4QspRhkxNe6/QwaBKn
	RpzEh7TaqyMe0iZnIH+26bmMJYOSiF2eCBhGTrLBfyGh90FHAJhonhB1yRvUKgiF
	K94ldopGPIYk1N0H1KvQWwUvym6hJVVgac9Jk3AsHQIA9kUPEjoro6/IRlFfF7Iu
	l2V3CXwBTvdEdEO1ALmwY9PXoTbP9yr8VN08HGUOMntjKrcG2okGz8HvycV91MtH
	0agcWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkf57bqku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 06:09:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34cc8bf226cso7128961a91.3
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 22:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768198167; x=1768802967; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh6TglTWfZdLP/kUy+grIeHYtilAn4T6Jx/ftoMhjBw=;
        b=MBYt7wuLNQ7NKDDCaiY0W8+W7jk/wDpfQ5KelacbXEipL5r4u08gYpTWWr7hbVVoed
         WgiGze181sJr3TtBZC9wdawg5oJQvaLbFVVsVqFWVunDM1FyeMMMUsUmpQsmhYY0QGIE
         1uYPrwRJQR4aNanbKry12dYs8LIckkD2mTiO/g54tw4tMXPvxmqnOVWAqVUuu77xTmBf
         fWhrzXf/DwCfD9WVSbX3GVThzqqgmNzIyk4dwNS+5Ws4cum+ngr9IjaD+tCf97FZjfJW
         1YbghoDij69z/75kGpuh16fhdTXgAGLyReLTGIN/Hd5gPlpnOg5GKB4k3G28q7/ngH7p
         YvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768198167; x=1768802967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh6TglTWfZdLP/kUy+grIeHYtilAn4T6Jx/ftoMhjBw=;
        b=UNUEAQWgGQeFzUtQnjyFQXI7fEYW+HmW7a/q8o7xMbrs6uZbKmZaXQXAUmGZeZmdxv
         L6d5JcjUGJO+TxobeP4VBYiTuswhfcERdi4l/nujpcSBVSsHdNs9gywTH1vFFNXRWrl2
         9J+R3GxV03u3GZKpq1YPDq9sT1jcLanvrfSzPSODbhlIAR+GSaraUFB7ItDLqiNa4zsV
         CE25gRVzBsL8/of+ggjuGHxAxoXje0dNZubVpPy0JJDRufLok4i/vP5VLg2ibYI4dKqK
         qgxjo5qqFNx8nh/jF2hdGBBAByNZ4DNzAPuofjDbFdl39ZYFmBdtr+VUfUCWKcxL0LFJ
         5HEA==
X-Gm-Message-State: AOJu0YyK+pnvKwgxf0cAMaB+uq0x5DzN+cmPWRi/JOxT5P4UmiQ2nOKY
	3Vhg2QQ+U2KS9MP+8wO8zamxVempIq7YZLg9LmpVJsLFvefwPJD71wT0LSL6Ebqzyuwi5RZ+kk4
	GArulBsKp6qXKPA+lclTOBsca/lCDaY1Mx+MbsVYUo4xiEU5TxGNNh3g/MfM15lifjKBznHw=
X-Gm-Gg: AY/fxX7t2ZSXT32bGnnFYHWUGeDwwaIDxkVbhQZwi+g+orq+e4QSDRnCsldju+m0p20
	lQmiwjMosMEbVe5CHcuH+Yt2sr49mHU/WFrQPDQDk8QM4P4LM6TXPbaBlqkWMCmIYgbffvE+6tK
	ikOpHTI2AHP5PNwxcV1fWTJS9+EShJFK1Fbh9DP9j9J1FdS8yG4I8WgovgtKpa8y+dIZR62R0uH
	7rxY1EMUBHresWXDfhQwn4VLehXcrjUfGVz/XSZEDtDOpIWuH/Bwf7ncjrAhUaeOilXvf3AJnYn
	E14T5WSSB7/lQywsj//xJ8w26J3LE5t88aOmTzqlfeKY5hcbxp7XJZihT8B0pcuXVHZsE/gEgQC
	wAfxi3pAtFefAekmnlyK39xH/0vlGpn5p5McPrA==
X-Received: by 2002:a05:6a21:998b:b0:34f:a16f:15ad with SMTP id adf61e73a8af0-3898f9dcb77mr17135154637.53.1768198166950;
        Sun, 11 Jan 2026 22:09:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU1ey8YfXPNjKqKW0x6nLEs/+Ys1wNIOgMECBxNphCRcsAlp7qCuTRDzh8IOuY/CHuDoM3Xw==
X-Received: by 2002:a05:6a21:998b:b0:34f:a16f:15ad with SMTP id adf61e73a8af0-3898f9dcb77mr17135133637.53.1768198166422;
        Sun, 11 Jan 2026 22:09:26 -0800 (PST)
Received: from [10.204.86.35] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c57ded24df5sm5487581a12.1.2026.01.11.22.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 22:09:26 -0800 (PST)
Message-ID: <0fb734a0-3681-4288-b73d-afd269ac8b27@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 11:39:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update ADSP firmware for qcm6490 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <89b5d0b8-9928-40ca-b8eb-f40080b6f3be@oss.qualcomm.com>
 <CAO9ioeUTNWu7YirxV-qnU3q9ot=Z1UYZug2Q4ArQBd+smQ+0mw@mail.gmail.com>
 <162744c4-4624-4371-84d7-3db767b40989@oss.qualcomm.com>
 <jkfd6edfz6lfvhz7ilma3ece2np4p6ybijgystonmoau2zrzdz@rm2odyjbopr6>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <jkfd6edfz6lfvhz7ilma3ece2np4p6ybijgystonmoau2zrzdz@rm2odyjbopr6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K/sv3iWI c=1 sm=1 tr=0 ts=69649018 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=000S6IerbV1m2ZdMb_AA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA0NiBTYWx0ZWRfX4DKJ5xZl800K
 due+mZvJsOGntugJ18y4MKR5wiiLaabqfHOtVEfjw1vUNqDRwZn6ADIV46XtxNZVTiS/tb78LnW
 gsN2JEm1OH9zOQVsJMJnBZ/44OQo23c28pIsbTLxuFhiOtkUIjIglq3vAgh0qCyRPdIbPL7FOlY
 DsUC2szjrlBaloAXsmPtnEnUb0tRvNnQmvcawQU1ByM7T/caxTkUpYZBZuMOWlUZlG4NonEn68O
 DQXukjD6cHO8U5wUnj9AQC1f4fg7vM0G2e7+A6lYkuFPvzzkn+9y3VMxUotIznm83gfu1voGZKk
 hZTbOmJDOX6Dz9XP66lqjtjIcPuBLFPWwxMBok50Js6FjY9CWRGveC/bVZKBqB28dnR+ae/M+Gi
 BdvkUVjcnY69PTkJQfTFXg8zKyZOXno35eDxLk5kmQlai5BX5rSyJNiy7R7SMKzzB86lnda3Aqm
 NgAkCI/T4a7+ORE75Ug==
X-Proofpoint-GUID: ZqaNBdvvKsVyLh66T5Y47QhI759chviw
X-Proofpoint-ORIG-GUID: ZqaNBdvvKsVyLh66T5Y47QhI759chviw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120046



On 1/12/2026 11:35 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 12, 2026 at 11:18:29AM +0530, Venkata Kota wrote:
>>
>>
>> On 1/12/2026 11:14 AM, Dmitry Baryshkov wrote:
>>> On Mon, 12 Jan 2026 at 07:42, Venkata Kota
>>> <venkata.kota@oss.qualcomm.com> wrote:
>>>>
>>>> The following changes since commit fd6473795fc677b981a076e12ff10044d3e5dfa3:
>>>>
>>>>      Merge branch 'main' into 'main' (2026-01-10 20:55:47 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>      https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> dspfw-kodiak
>>>>
>>>> for you to fetch changes up to 1ddcf07a2c4859c6914660a077c5649dc4dab281:
>>>>
>>>>      qcom: Update DSP firmware for QCM6490 platform (2026-01-12 10:42:59
>>>> +0530)
>>>>
>>>> ----------------------------------------------------------------
>>>> Venkata Kota (1):
>>>>          qcom: Update DSP firmware for QCM6490 platform
>>>>
>>>>     WHENCE                |   2 +-
>>>>     qcom/qcm6490/adsp.mbn | Bin 12693084 -> 12095036 bytes
>>>>     2 files changed, 1 insertion(+), 1 deletion(-)
>>>
>>> "Update adsp, cdsp firmware for Qualcomm QCM6490 platform."
>>>
>>> Where is the CDSP firmware?
>> There is only ADSP update. Corrected the message to reflect the same.>
> 
> Please send new pull request so that it can be picked up by the robot.
> 
> BTW: is there any changelog associated with those DSP files?
There are few ADSP fixes. Should we capture them in the commit message 
going forward?>

