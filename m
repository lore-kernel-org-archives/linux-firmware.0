Return-Path: <SRS0=Tc6e=35=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7F9CAC59A
	for <linux-firmware@archiver.kernel.org>; Thu, 18 Sep 2025 14:19:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40A18C4CEEB; Thu, 18 Sep 2025 14:19:00 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 57106C4CEE7
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 14:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 57106C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IB4nDZ021478
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 14:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vM8Ne0jyA/UFBixUVOgPrw13g4V2W6ypzv0Gw7UOeKM=; b=DO9Qj9AxlE6CC8Nj
	TYKkE6d2cEOyk33bs0sXEkirN47ttLVBQq4yZUX+ML4DUuAt1vijOSJ2hILZXpPL
	HaxTBhiNR4LdUrfJGY9KZScZj/1dfILW6gueM+rjzypOJPiwkPLJGZtntyRWglSa
	0Y3XAEHGFYD0+2UIK+r+WJzt1kjiknBxtPp/vRtjmX8glYC7XwkAPlc+2c+AZSct
	WZx7GSP3ft6RcI2fWYzy6ZFrPczDyI2abrtcixXYExifTbxRQy8oHDBIdnnPZUn+
	6wX5RTj9ddbqLApT+yjjmlLQ0d/PsaGJJ3LxaOig8xMBSW04v2EKux23S7eeHVP8
	EIJyXg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy5ep2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 14:18:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-777d80370a7so1770574b3a.2
        for <linux-firmware@kernel.org>; Thu, 18 Sep 2025 07:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758205137; x=1758809937;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM8Ne0jyA/UFBixUVOgPrw13g4V2W6ypzv0Gw7UOeKM=;
        b=W0r6spgosSBo3AynI7UTQdS5R1hqMEYs6Its6j9x4WvwMPkVs3+PM8rDhI+c6RnAGE
         mJ+jdRKH3oPJhqPaIaaQqzFz+3n4SS+lw/UjsEaRtATNig6aJo20M83ApL0xsYhshluA
         a6W8HcfzfdlEeaqU6CpgM8aP5+ys3suQRjn0EhtYrDBbjuXYhi6lMHJzuvl6XgBT7ZnJ
         +9llrNxCdiuGXs5FjP2vF+xzkRNdtn+pTJs4640mb6/bRhqwP4f/vsWEJMQtgcCR0NWl
         dF+5PUldiRQ44st/C4vBDL9mN8kZGfPQA3FWqXSdoOrRd2z0tV5QbPIA9VbUjK2KdEeL
         Ikiw==
X-Gm-Message-State: AOJu0Ywh6AWUkEm5A8cwGXHobIB3ocr6MfJ17CR/+tNdsMw10UNQ43Jh
	4IV4f4246Moa11jalZakBPFbXcyDF6ElrkIMxwLjxUZ6hd8ShrnFuzKfqmwyboqKDisI4HeCr5d
	u6G9NrFWNG94ZEQNLS8+azr1LVpFbKP3C4abvmgIuthGHokqMJuWy04g/ipZsxTI=
X-Gm-Gg: ASbGncsDAQqLfzX9urhrQ6z+vjBxPv01mSNUdnPC2KI+3Q/w8Q81s6g/eZF9mu5WgGI
	L/HoLuP4RZacTwkenBLDwOQBce8EGNNVTmSW5AAKDX06fADOfERBRTIlEd599ELhSpDodIfk1xd
	Vymtk9Bc7a/sMIsGY3kTLhJfbx/Lkjc9soM11cTQBWGrQWjf4NNLQrQ5B7+fVmp+V/4wQf0kTgg
	U3zGIpJ9ezlhy+7KPtVOclA2MUiY2TxY1NBKwi2L6bdfUYoe7XcFT+O0V/RUlG3cr2sntmhBHlH
	4vSQjBfgmHlzgcxOCyBQTmIePGLTCL2HAZJn3lboDqSnHr1s7Nn8/vsimlIwJUZuK1mL2ryW
X-Received: by 2002:a05:6a00:3a10:b0:776:1de4:aee6 with SMTP id d2e1a72fcca58-77bf8b77fd7mr6292040b3a.16.1758205136673;
        Thu, 18 Sep 2025 07:18:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFupfXqlEq40y0DGEXSVRnq7yMO08rLUbRT63w0Ks9rHcFwhyzXXHifDR8Io8QTzDp5BDGPPg==
X-Received: by 2002:a05:6a00:3a10:b0:776:1de4:aee6 with SMTP id d2e1a72fcca58-77bf8b77fd7mr6291993b3a.16.1758205136065;
        Thu, 18 Sep 2025 07:18:56 -0700 (PDT)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbc771bfsm2519876b3a.3.2025.09.18.07.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 07:18:55 -0700 (PDT)
Message-ID: <ce6189cd-1355-47f0-bd03-79746577196b@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 19:48:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for qcs8300 platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, ekansh.gupta@oss.qualcomm.com,
        bkumar@qti.qualcomm.com, kssb@qti.qualcomm.com
References: <fa431a1e-75a9-4c89-b790-81368f30733b@oss.qualcomm.com>
 <zzjkhxoizdb3cukpqqlrgkrwqrk2cgmsuc3bnjrq334pn2zxzz@hwqba3vx7lu6>
 <4264588a-93b0-47d6-a8be-9ffca550142d@oss.qualcomm.com>
 <CAO9ioeVC1H5c4RHoUroytAUbO9hQVvyQ-ep_ofUP-iR7EgDg2A@mail.gmail.com>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <CAO9ioeVC1H5c4RHoUroytAUbO9hQVvyQ-ep_ofUP-iR7EgDg2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pptBK6SoG-gx9DfrXmC3i-EzUwH2dRRo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX/uXc2CMA/JFP
 /nJkCrSAL8o3PjPwxFdVAfc8wpAbSEum5LtfFDmE/Xg/OoGoCfBIiTKX/3XSJLU67yVivuY/0Bm
 dn1Udk5VyEF4GzfrL7g2g/2hhOxBRKdRLEYEzIHm7QM+kTmbPcdiDqcqzQOQfM/FW+xwNBErb65
 4/RdoGnskdEjvPkxdQiVYczKt1TAqhL5/RsPp3P/++N+SZE7+txI71HbkduSCv5YDWoRsoNQ2oy
 49odUg+p9SmQ23JU8xLRnxfgfQRSJyMLKDdCtPaxiNOrmWJSpcNP0zOIJhJ3hmWUdlCt5ddxNEG
 VnRSptkatPdSkuonJ/ccN/jllrmjcGanswjCYNUFlezQzIVJRqEXCGV0WRIHDkI3q+l41AeY/8F
 uB+qhO9M
X-Authority-Analysis: v=2.4 cv=Y+f4sgeN c=1 sm=1 tr=0 ts=68cc14d2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=XylV4LZNQg5yvtqs2S4A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: pptBK6SoG-gx9DfrXmC3i-EzUwH2dRRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202



On 9/18/2025 7:37 PM, Dmitry Baryshkov wrote:
> On Thu, 18 Sept 2025 at 16:50, Venkata Kota
> <venkata.kota@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 9/18/2025 5:48 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 18, 2025 at 12:09:32PM +0530, Venkata Kota wrote:
>>>>     Merge branch 'en8811h' into 'main' (2025-09-12 14:23:45 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> dsp-fw-qcs8300_1
>>>>
>>>> for you to fetch changes up to 36da01bec9809f7bd96594db4885a86c286e90a9:
>>>>
>>>>     qcom: Update DSP firmware for QCS8300 platform (2025-09-18 11:49:22 +0530)
>>>
>>> NAK, you are explaining what GPDSP is, but you are not explaining what
>>> and why is being done. Why do you add Audio PD to the GPDSP?
>>
>> There is no specific change made to GPDSP in this release. This is just
>> an update on the previous label Version: DSP.AT.1.0.1-00096-LEMANS-1.
> 
> You have added Protection Domain definitions for GPDSP. I have been
> asking you to explain that part in the commit message.
ACK, I will do the needful.>
>>>> ----------------------------------------------------------------
>>>> Venkata Kota (1):
>>>>         qcom: Update DSP firmware for QCS8300 platform
>>>>
>>>>    WHENCE                   |   9 ++++++---
>>>>    qcom/qcs8300/adsp.mbn    | Bin 6643712 -> 6684672 bytes
>>>>    qcom/qcs8300/cdsp0.mbn   | Bin 3084288 -> 3080192 bytes
>>>>    qcom/qcs8300/gpdsp0.mbn  | Bin 5832704 -> 5873664 bytes
>>>>    qcom/qcs8300/gpdspr.jsn  |  22 ++++++++++++++++++++++
>>>>    qcom/qcs8300/gpdspua.jsn |  29 +++++++++++++++++++++++++++++
>>>>    6 files changed, 57 insertions(+), 3 deletions(-)
>>>>    create mode 100644 qcom/qcs8300/gpdspr.jsn
>>>>    create mode 100644 qcom/qcs8300/gpdspua.jsn
> 


