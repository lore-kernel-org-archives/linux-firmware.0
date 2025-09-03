Return-Path: <SRS0=yW0i=3O=oss.qualcomm.com=akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A5CA0FF2
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Sep 2025 10:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D380EC4CEF5; Wed,  3 Sep 2025 10:26:39 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F752C4CEF1
	for <linux-firmware@kernel.org>; Wed,  3 Sep 2025 10:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F752C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832mHjZ012509
	for <linux-firmware@kernel.org>; Wed, 3 Sep 2025 10:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VrzUVQmAKMcN3xpOH+43qDQTtOEMZcm6ShkXiFo/PiY=; b=enyHSIRC9afPEVBG
	HD+77xhfuscV7zFcjj+bOFT0JHqHjWRidNOCndhXkZn6Ew8a9Rodpaz2Wfr9oQlk
	0hwi4d0njhWvT9QRijo37kh/XK1mAUN1Oj5VbSf5La/VHxW9WqUqacB/IFvSrVby
	filTipGCfx8t9w4eZlwUg9QYjNznVdDgnvp3nr598BQqXqmTDQTHTAnXTn2CR8Aj
	6OFeV0B7ZXijTKBCJ9AQwnk5MEr9vQCJq2GUZsEQ+YA8pvbw8SndZCuTLKJUKisY
	d5gfkyO+rg0TbH5Z4wEqJMMcFb7vm7njnyq77+4rctPWAs0fK/gT+uAn60Kjlzhm
	3Pg66A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fk42b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 03 Sep 2025 10:26:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329dfdc23d2so1856060a91.1
        for <linux-firmware@kernel.org>; Wed, 03 Sep 2025 03:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756895196; x=1757499996;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VrzUVQmAKMcN3xpOH+43qDQTtOEMZcm6ShkXiFo/PiY=;
        b=coDhblI+5NqWS5V5AG37tnwaFgxh6wy7Djvdvu/o9CefxY5ZW2hzfWxsiOT4fm3Dva
         /D8dXYzSuwfYiED6KcLRqcRnqM7qpO9A617MEWSfka0lgYwlyNVG+5PNyBaeqL8r8dyL
         Xnfx+Lg3YMkSIawMyXD6Sl9Rfd9a4zCt6qePMv+4BJSviKbwjxAsoUI0jAimQkpwTMpo
         60zzy2gwJCxeH1uriE0SrZ63gXnURdb2OxXtkFNWFDBqP93c7KFmvvY1+DtG9vRw0t5i
         JjDtsZXIXgtCS1nkU8ohk0hmUiKABGho2NTKM3wc3fpPHXd3Fm6nRiOhEYEC5PJMI7fD
         5QMQ==
X-Gm-Message-State: AOJu0YyCfB7VwXg2eRLuNvF8+e0Rj6ZqTIk6Ff8fG1ZBVvFMn5Tui00f
	grw2BdCg6Qvh8JjJnDqLNfm9POZ4UM4pfbkLQpVDN05h2yLwJs+0Ptku7a5CFI2X9xaHMGnOSAf
	VcnfllZbBcqmvBPWHohIjw4iv0wJCsGD5/Qb4f3FJobavmx9sG/fIkZ4Lfs3LfNY=
X-Gm-Gg: ASbGncsJFAye1p14HhVglsoVIgSgbSmshe+uowrqJVcv3MEcqDZoZB7gD9fNaOlcp2g
	jW4puTt7v2A2wqP3ERdM5SQ+okCmiPB25D0qSwLFYji8y8X/hzqREsvsLs+XuZQTQstP6LMVpO3
	FbTEcnxCfZsA5oj2/w0aKB/4kRW0DMLCA8oAeVnZFGSeKXUNTfFquIWcULqTzrp2M7NRgGfJKXw
	cXD6rITCK0ISmFOoX6hu4DUY45tVG8AXFyeL9gnmhKAUW/nrAMaF45dJWC5jATA6LIwsiUeGAjB
	SKhfsnGLEfPXsAanzbZutDjpSh0vnYGYzdi1LKPLNMEN6iETZURgdrxhy5i+lw==
X-Received: by 2002:a17:90b:57c4:b0:327:7c8e:8725 with SMTP id 98e67ed59e1d1-32815433ac3mr21125878a91.10.1756895196147;
        Wed, 03 Sep 2025 03:26:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeHt+FZJr/oshesAPRjFlsqyUzkPFEjQZlXAYTsM+/nRYOn0coFHBtCtJmuCBqkgBnjop2Jw==
X-Received: by 2002:a17:90b:57c4:b0:327:7c8e:8725 with SMTP id 98e67ed59e1d1-32815433ac3mr21125792a91.10.1756895194967;
        Wed, 03 Sep 2025 03:26:34 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32b747c2d66sm759489a91.28.2025.09.03.03.26.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 03:26:34 -0700 (PDT)
Message-ID: <15ad368e-0d36-41c7-a9be-71d08ba1efe2@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 15:56:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset -v2
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <d2e4501a-937f-413d-a58a-1a461c7947c2@oss.qualcomm.com>
 <cefhytvrazclwp3qicixaf3wh2p4vffhakt62of4cqua7rj7ok@r7gdz3nhgo2p>
 <27ae02e3-bb40-4bcd-a74a-eb228833add0@oss.qualcomm.com>
 <pnhpmwpdnhkexejum5zriq62wj7y46ot4elrlvcvwpmmfvk4mq@lskjszqjyedx>
 <CA+5PVA4=8c+_ocTJbzQ_vZCNUseZbjRoaqs0GZonVYt4KWPTWQ@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CA+5PVA4=8c+_ocTJbzQ_vZCNUseZbjRoaqs0GZonVYt4KWPTWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX3jcFEmHj4Prq
 huy4OTLiNPSnuBCX4/DDbecuaMGOY6+eUkvUHTV2uKAvhqSsQb1fM4T49FgEaIMwxegzQEokHuk
 VNJzJw26HTG1Ab+E+wkWwlqQgkhBIyMImmi3Xtdh1CY+PoS2dXtnCWuhEc4XkKibOqWp6Egx9dN
 yWwTckK4+FMorFElGHhgy5aaTpq5BKZE4wrbD7ooF9cEQ7g3bcdZbwqZmd5vHTCBOiXQFUAbqFS
 olF94aVem22rcTNg75r4fSDeZQJt1bpcRFq7GW+mpWAGD6a8UgsPFD+rV3Q9q0834hljPyDARFe
 11+0Lbpo22getdCAxZvgEd0pr0MEBzthQM68JtcMDGrtMJOBLO3X92MTyWkLq0yswJDZXYd+dfR
 Zvk7pKF2
X-Proofpoint-ORIG-GUID: MUwrAeXXQ_eKsPYv4KFXZxDViTM8-nvB
X-Proofpoint-GUID: MUwrAeXXQ_eKsPYv4KFXZxDViTM8-nvB
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b817dd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=p0WdMEafAAAA:8 a=qC_FGOx9AAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FVBxP5Oe1qbUwXYUVckA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

On 7/16/2025 5:01 AM, Josh Boyer wrote:
> Pulled and pushed out.
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/613
> 
> josh
> 
> On Tue, Jul 15, 2025 at 8:16 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Tue, Jul 15, 2025 at 11:58:08AM +0530, Akhil P Oommen wrote:
>>> On 7/15/2025 3:54 AM, Dmitry Baryshkov wrote:
>>>> On Mon, Jul 14, 2025 at 10:55:03PM +0530, Akhil P Oommen wrote:
>>>>> Hi,
>>>>>
>>>>> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
>>>>>
>>>>> -Akhil
>>>>>
>>>>> ---
>>>>> The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:
>>>>>
>>>>>   Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
>>>>>
>>>>> are available in the Git repository at:
>>>>>
>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS615v3
>>>>>
>>>>> for you to fetch changes up to 6907a7a381dd13d7fadc3a480ad470151c3f3782:
>>>>>
>>>>>   qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 22:47:07 +0530)
>>>>>
>>>>> ----------------------------------------------------------------
>>>>> Akhil P Oommen (1):
>>>>>       qcom: Update gpu firmwares of QCS615 chipset
>>>>>
>>>>>  WHENCE                   |   3 +++
>>>>>  qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
>>>>>  qcom/qcs615/a612_zap.mbn | Bin 14256 -> 14256 bytes

Hi Josh,

The latest tip of 'main' branch doesn't show this file. File size
is 3KB instead of the expected 14KB. Any chance you might have
accidentally pulled in a wrong PR?

FYI, there was an older PR which we decided to drop:
https://lore.kernel.org/linux-firmware/d052562a-008a-4b80-b1ac-7340624bd596@oss.qualcomm.com/

-Akhil.

>>>>
>>>> This also sets several additional flags (OEM_ID, OEM_ID_INDEPENDENT,
>>>> etc). Could you please confirm that the new file is actually necessary
>>>> and that it will work with existing SM6150 devices?
>>>
>>> This firmware file is for the not-yet-commercialized QCS615 chipset
>>> which has a newer non-hlos which uses a new security profile. SM6150 is
>>> around 8 years old by now. And it is not supported in upstream yet, so
>>> no user afaik.
>>>
>>> In case the sm6150 gains upstream support, a zap firmware that works for
>>> it should be available at qcom/sm6150 directory. I think the current
>>> firmware with v1 profile may work, but can't be completely sure unless
>>> someone test it on sm6150. Not-a-lawyer, but in that case, I think
>>> anybody can copy it from the git history of linux-firmware to qcom/sm6150.
>>
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>
>>
>> --
>> With best wishes
>> Dmitry

