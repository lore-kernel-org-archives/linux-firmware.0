Return-Path: <SRS0=Q2Qw=DK=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F083FCD37B6
	for <linux-firmware@archiver.kernel.org>; Wed, 13 May 2026 06:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7BDCC2BCC7; Wed, 13 May 2026 06:58:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D725CC2BCB7
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 06:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D725CC2BCB7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p8qc2932929
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 06:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CL1VJMcmNZPdtP0hI1VsQu/r0CgdDDZSUZBJJT2ofcE=; b=oGUCYrZ5wEZpqrdE
	NxVDHhchq2XEIT7HID1vvXF2PYlQXAnRXwIHJ8j6+JbQfrdP0mg3pgeEEYBVvC2p
	4DzYB4b/pk53Kbf1ZtdELirTBL7f9nMjG8e4gau3OvDu5uOAGnDKJ0Ub2OTba4d/
	6DOiQDrTtJS7+wjMpv2W+Iw3UmmY+tP/TNBYVvNCkFz0mWT6oJgIlWnCdpybkCq3
	dMTp/TAUH5hDIwAEIKNo2kh2xFPAzUqRY1ylcTMI69dGn7E3PmtfKUpmdswUdiG/
	UDnvfEvfyaPU04sdqcC2gjSZHz037rqLeY5ggVuiSz0206lhEzn5g7LxFQyRPxZK
	lY84TQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319v4vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 13 May 2026 06:58:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c828659ecd4so1914061a12.0
        for <linux-firmware@kernel.org>; Tue, 12 May 2026 23:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778655522; x=1779260322; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CL1VJMcmNZPdtP0hI1VsQu/r0CgdDDZSUZBJJT2ofcE=;
        b=aUZEZNSDKeDzqkNuv47Vpq1qAHoPTPnxzJG+7WsyINZCdkF0xTee5BeOo/FQv3Hrkz
         LsSsqKutfVTtZPm0zrl366BDlCGZRKESATZcmkyDgmAbreKfrt8riC3YLdHr2VTaCDTb
         egSMSO6rgJz0awAd9c8FQUyN1IDO+fAA2l12qUT4DHJoLU1lIFVIUh0LAjHFt/mgb5KO
         QG0B+rVHDsDc7zNHYLWDY9HlFCE3CPvmQNUTEmgWZG089TDBAoWikyX/Nniw00cVy4fh
         jkLyP/7HLvPrOdQHB39gxwESRuxoTFsKd4dWyEaztLR0IvJYz7+AkF50nbPNO1lDsL/q
         lReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778655522; x=1779260322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CL1VJMcmNZPdtP0hI1VsQu/r0CgdDDZSUZBJJT2ofcE=;
        b=DZDAy4z8T660rVA7DlFhuMAofUU9QEkzHAM7UTUeaW/4aMqUhoAYjsc6fgjvPr/q+q
         f8seRdKrQPvZdWdBZfOnz/TqCovj/ocfgVaHD4C4FtMYEFJCz02Ts5gXSVNthRs4Ojgh
         nfxXytldSjrgHzXbeL6BuY7zPfbIhKhrfNY3tH8OBh6ExM47ThZ5eeua7Pk1Ewo7lV6Z
         4i7w/qnOtRexzPBZ8SVW0iNUglz+E5ImKuCmXk1sHicISnyCFJaRLCOrAShqmRVZ/yPN
         egXBMkF6XC1BsgtC8EBcMY3uag/tIKmkHnS4IrjMdcE4E2Awn541ZmsGgDmvcUYU+yu7
         CpxA==
X-Gm-Message-State: AOJu0Yz3FM+oTqIR2uMJj+XM9DrMG3trpCutHsSk2tfcV5vpIJyCKQ6C
	Z6sWsT+5YOoFjrVyRGjzEweS9jYR0XYuoDXA8IX1bx2T44/M6Q085WY70OmC7B457BqE8pfnU6X
	GllFQew60O+YKrHb79J1XEOYhDCF//UmcecBJLD2QmP+0JtjKEKlUD1tqsMzUzyk=
X-Gm-Gg: Acq92OEtE3iH7VXNVplCfp2oWVTLaqnlMYCu7zVBhndQnXQshf2mbL3xbtpDPAk6pUc
	zwzjssNbAmQq2S2PyAvB6qcBr2OnYC1oNdXRKeknzVieBoZQv928zRmxM2u+Yg+0//CiBwpQRGb
	xXD57hl14Lx6sKi0WDzwIfRvdjyD46kk8uhB8yv6cW6WGIZ+mJC0+lH2lXNniZGR0fGxhXPeudl
	AAnl/YPFcrg1q0nT4uyZMNDxfcLF3DEkPMcisREQe2vPn8TkQUWZC4il/8rW7bDpVc5RV0Z4yMW
	7alPY1yZMdWKhUNqRgac4UlKZhFzuYpr9D2Ha6Yz0rxSyR8yqbeJ1rjMgkgzBGlYQfW1gMasK4Q
	cRkhZckTfesaOqobFtnxkLoBVqYAWOZBDyq2jEiqfv5oBxABV8P4=
X-Received: by 2002:a05:6a20:939f:b0:3a3:2b7e:a4ab with SMTP id adf61e73a8af0-3afb00314e2mr1814723637.44.1778655522418;
        Tue, 12 May 2026 23:58:42 -0700 (PDT)
X-Received: by 2002:a05:6a20:939f:b0:3a3:2b7e:a4ab with SMTP id adf61e73a8af0-3afb00314e2mr1814696637.44.1778655522008;
        Tue, 12 May 2026 23:58:42 -0700 (PDT)
Received: from [10.204.86.121] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839656464fasm25694269b3a.11.2026.05.12.23.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 23:58:41 -0700 (PDT)
Message-ID: <82786487-264e-4cd5-bb2c-dcae9813de4c@oss.qualcomm.com>
Date: Wed, 13 May 2026 12:28:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Add cdsp1r.jsn for sa8775p platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, venkata.kota@oss.qualcomm.com,
        kssb@qti.qualcomm.com
References: <2d982640-1f8d-47e1-b626-2e40d69eba98@oss.qualcomm.com>
 <xfmj6boz5a4lbu2lvgnpmrikjkfcbgbog7ue25bo5medqbe25v@zidc6g26ukza>
Content-Language: en-US
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
In-Reply-To: <xfmj6boz5a4lbu2lvgnpmrikjkfcbgbog7ue25bo5medqbe25v@zidc6g26ukza>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA2OSBTYWx0ZWRfX8eDPmNUOOPwH
 LBEqjZ8fS6B/M5R4aV9FJZiDiaT8HPYQgU0XunypZ3bxHTBLGO9vRfn4onBsME/lSxRhXhcT5w6
 Ei3QgQjrN+fEU2yz4p91EH0za9iHDHfJ9zqZsuzwojyIlkU8kBDVDs97ieS9atD3ZkI8dfFvkAJ
 74bgvD5jcLFS1+jkS4AB4yrcL/V66XoLrh+sdivlMNrKeu0H0ajlSx8T6TuA6g/oQMtDdCkrydC
 wYz+7Chkjlp0Bh97SdnxKJLXq4PBQiDx5/njHp3mD3wBmIrQmhk8Cp1m62OsWmxHprSRYhbppAO
 7dnaLKyiBLYEPkVPL4jr2otcFZPb1DfndgGHQI9XhkE7WXiWwveTnVz8Vuhg8eD8GvfLTyJqVzP
 ToOHuZbw8uMMqXMEoUbIWls4rTgHUh0we6m22iDOwzKIDC+HuuG86G5jMJcxXHheYMzeJILJk5+
 DrPEiHFcEU+n6ziENug==
X-Proofpoint-GUID: 2Fkynvj4lsYfJQ9sfL-6fMzpdcOyYqwa
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a042123 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=qC_FGOx9AAAA:8 a=3C1IY_mSYnZJFgwLOGwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 2Fkynvj4lsYfJQ9sfL-6fMzpdcOyYqwa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130069



On 5/12/2026 9:05 PM, Dmitry Baryshkov wrote:
> On Tue, May 12, 2026 at 07:30:28PM +0530, Saddam Patan wrote:
>>
>> The following changes since commit b965e85c15a94974d4a6390972fc1cbc1bb109cc:
>>
>>    Merge branch 'amd-staging' into 'main' (2026-05-08 18:54:42 +0000)
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> dsp-fw-lemans
>>
>> for you to fetch changes up to 6a81adce2fbb4e281a7508fffa76f8fbeed79996:
>>
>>    qcom: Add cdsp1r.jsn for sa8775p platform (2026-05-12 19:08:11 +0530)
> 
> diff --git a/WHENCE b/WHENCE
> index 3a88a751..34abea5f 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -7040,6 +7040,7 @@ RawFile: qcom/sa8775p/adspr.jsn
>   RawFile: qcom/sa8775p/adspua.jsn
>   File: qcom/sa8775p/cdsp0.mbn
>   Version: DSP.AT.1.0.1-00196-LEMANS-2
> +RawFile: qcom/sa8775p/cdsp1r.jsn
>   File: qcom/sa8775p/cdsp1.mbn
>   Version: DSP.AT.1.0.1-00196-LEMANS-2
>   RawFile: qcom/sa8775p/cdspr.jsn
> 
> This is the strange place for the file. If you were to keep the entries
> sorted, then cdsp1r.jsn should come after cdsp1.mbn. Please correct it.

Added after cdsp1.mbn.

