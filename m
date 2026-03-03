Return-Path: <SRS0=Z4Oz=BD=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7113CEC142F
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Mar 2026 11:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5243AC2BC9E; Tue,  3 Mar 2026 11:10:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 85504C19422
	for <linux-firmware@kernel.org>; Tue,  3 Mar 2026 11:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 85504C19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nH1d3349620
	for <linux-firmware@kernel.org>; Tue, 3 Mar 2026 11:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EBPhROPM8AUZRIvxTSj9zRaH2/+6ntieFkv3Vr/pITY=; b=TCobuMN+F2VkeTHj
	o+ETuSg24vQL+xT52y+zjG9UUQqKgGmn8k1y6173jYcLuoT4oNut1LEMg7MFNDls
	EBFciLVDkc3GVOSPKqmfUCxEAS+u2KVuUq7iQJm0iULv0M86b4Ms8UjXKG2ftWGQ
	802URF6Ngpqvtp3Imza3pAPI4pxBenFPMj9U9qjz0ebwyVa8rS08v59h1B6eikPz
	7vCRrhGDZcke2XqulhHVCdkiy5YasZdF8fR2VdxtXNhp5p2sHKpwVboYR6rBYWz8
	fB4xtqDjaROe7YTwicTLVtl2BdxB4eV+4hUo6Fyr5D2wyjLbqgV9GPAmuqwvjOjK
	hQjrbQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsahbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 11:10:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c70f19f0f37so3157768a12.0
        for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 03:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772536226; x=1773141026; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EBPhROPM8AUZRIvxTSj9zRaH2/+6ntieFkv3Vr/pITY=;
        b=ivIVcBiT1IasyQYm0iPwk2zn50eM9EuBtBFeNCkfH6TGlK+2Jp2+7/x1WwSKYX/wGA
         6tGpRRctiVo8uprgwjnPqUdGAHq7rLLHXFNzs8XRdgKi2F/adEOq46NwDFOqOrnRc2cS
         4bfO3OXiNjlFzxM3ipQDmX2XxXhXUMYiahxfQPfybOt9Avb6T5FayKYCBFEtlhNK9RvG
         Mg/9WLZxNCFzm6eBOyWoe6+wHLBNLxoip0JxUawHCei7pUGzs5c0poGLavbnTs9gFu12
         Ue+QErX/IP/McxCZqwl2IcnsmL4sFC1vRp+ltvvCY0/Aq5VQLz4cbt7pylQiu2fX2Zr2
         DSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772536226; x=1773141026;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBPhROPM8AUZRIvxTSj9zRaH2/+6ntieFkv3Vr/pITY=;
        b=KQk/y+EgWIDRWMpauHO1vhh2vrcWfIHu8xd7y23dgsXuP119D8+ssAHl+nBYLgMfny
         VeufBvjVSoli2AKMv+1EKuWVkU0pZ3L+qN8VfhkqxtIIlOSlyF5SkOq7GI/4dI6dWdz6
         tIUJ+Z2tKhNuW1GGOvo6PW2/Yy2pdBDk02SSEDt2dK9IXwWiAxDvJo5cMj3pFTap/kQi
         yDRxJEJgUyChnWmqUkm4VLVjOaQv0CB8f2kdGiIX4OAJZ4hJzW565RsSaQMhYqrAQTCB
         JZ9AfMicyaqyJ+7ms9rZtrbcjJA9fg4kYAV8ICilsF5knZSacfE1U0l35g6ZvNfsMEOa
         0kCQ==
X-Gm-Message-State: AOJu0YxojzIc/VTjVZnChUM09PfvInVQRzIh3g9eDx/uNYEgiyG2Nq4F
	uGtr4vRW+LIxbpu9zF+sP1HMGimTJtDjb8Xcc3js9LoZ9Jc1DQCTNyNpo7AUBADDnH2cfIWSiMt
	iO30T6aNMZxDxfoyv44nPmOpeeICDalzNqiB9585Oixy6Z9DabRGiZK9eAI8UHQxIyc+XnOA=
X-Gm-Gg: ATEYQzz/Je79HeuSYaSa9n1b7oZeTcE1V8JT80hiBc4afM+4DpIedZ9kH1FJK4rtIOB
	UUBXi7/4gJEzglKGthIyYULVbTs7G7/CGUKV4371uZz/syS9fl9GvFA8FC8ZsyRH/A7FwLLksKB
	AtZRq3TBjNghflDzH7WIkNpPN04LAaqEV8JOY6/LioESbgFDW80KV1fubXtv3+ZlTMBgjGs0OKh
	b4l9I6jugQyETAfpcYW7Di7//Cxft8qtKCkNQn8YQFGCmGbr8wUZbO/36yKImIF5oKYPp/Z2xjX
	PCuXQ8eVplPodTdX8wyiQ0vZVIKs/Z45Jl6NApnFpMvIHpMP/tCH9T8I/tU/sgLUZKSgTIDfAfD
	7hAAj3XCTQsDwZHeqEEyITMTfDwfO9k9f/ha8OlXEv3PK72us/NEZ
X-Received: by 2002:a05:6a21:790b:b0:35d:3533:3dd2 with SMTP id adf61e73a8af0-39813e87987mr1501889637.0.1772536225635;
        Tue, 03 Mar 2026 03:10:25 -0800 (PST)
X-Received: by 2002:a05:6a21:790b:b0:35d:3533:3dd2 with SMTP id adf61e73a8af0-39813e87987mr1501861637.0.1772536224971;
        Tue, 03 Mar 2026 03:10:24 -0800 (PST)
Received: from [10.206.100.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6d5970sm167461825ad.80.2026.03.03.03.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 03:10:24 -0800 (PST)
Message-ID: <9ab993ac-b46b-4fbd-93d7-be600d746076@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 16:40:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update ADSP, CDSP firmware for sm8750 platform
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
References: <616f5563-0b5e-45d2-9d6e-ec333c670d3a@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <616f5563-0b5e-45d2-9d6e-ec333c670d3a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: UzE2XRxHRntjrzDG5dz85Krt10c9tOgU
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a6c1a2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=da8fxQNjThx34T4lXPAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: UzE2XRxHRntjrzDG5dz85Krt10c9tOgU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NiBTYWx0ZWRfX/8FvFRMhltY3
 oJ7OkYZOnL6qacRuThjGj0DqGB+oCNugg5TEf61OoA5NUoJkocMSahQaMTFpkOxXON2RPk3rRkr
 AXfxSXrUdgyCHWrOVKGzfJrdKQ/9YW3h/2D65nY7xuEy5WqPuae7D7N9TiEnjelWmHGTSMREplq
 BCIU1t/dyKADQRXXLvCOHI408DlJAeHjyrOfiCd9f9Mt8g5bnK3akpzmftD8Iehjfo84Jt55XxU
 xFacJO0iWLdXdkPGfTZiymQ/3Qk2fJ86EP7R8tSkx8OhJp9PEXhC3WfGqxyU4iOnayn8/OvUDHR
 vHJEjkXWL36Z649WSZlsTeBwKRDJdozQyNr4mM/iYuVGxAud4Nekm5u03mWnYv71e5sIobGTO0d
 sTV9Dw/qdyazBKN2lrY/HXlqotmsay8uask/4NoLVHIMlXiDaemJRtIVZz8vxu5I5irWPu2JuCG
 7fyYk38KPSCXnJDkMXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030086



On 3/3/2026 4:35 PM, Saddam Patan wrote:
> The following changes since commit 
> d8e138dd8970ffc9f5f879e2d62938abe6cd3f22:
> 
>    Merge branch 'bt-hsp' into 'main' (2026-02-26 14:52:51 +0000)
> 
> are available in the Git repository at:
> 
>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git dsp- 
> fw-sm8750_dsp
> 
> for you to fetch changes up to 59e01db298ddba41ff4aa7c94da332b3d868f8eb:
> 
>    qcom: update ADSP, CDSP firmware for sm8750  platform (2026-03-03 
> 16:32:21 +0530)
> 
> ----------------------------------------------------------------
> Saddam Patan (1):
>        qcom: update ADSP, CDSP firmware for sm8750  platform
> 
>   WHENCE                   |   4 ++--
>   qcom/sm8750/adsp.mbn     | Bin 19421576 -> 19413384 bytes
>   qcom/sm8750/adsp_dtb.mbn | Bin 180024 -> 180024 bytes
>   qcom/sm8750/cdsp.mbn     | Bin 3912104 -> 3920296 bytes
>   qcom/sm8750/cdsp_dtb.mbn | Bin 36664 -> 36664 bytes
>   5 files changed, 2 insertions(+), 2 deletions(-)

