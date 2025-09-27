Return-Path: <SRS0=rLAR=4G=oss.qualcomm.com=akhilpo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E6DCAC5B0
	for <linux-firmware@archiver.kernel.org>; Sat, 27 Sep 2025 19:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12DC0C113CF; Sat, 27 Sep 2025 19:01:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7A95C4CEE7
	for <linux-firmware@kernel.org>; Sat, 27 Sep 2025 19:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7A95C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58R3Q1xe015899
	for <linux-firmware@kernel.org>; Sat, 27 Sep 2025 19:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6b++rfN5lm5dPSAPZljq8g4oaGNBOgcXQGRXXKt14X8=; b=g8d+a6blrTWyTl2Z
	OJSC0X9W+L1NcBgVV4Mrt1arjNgGblsdkdzzRdyJRcmYN6i/k1YKl4IZxFSKk46v
	ez/DcN1ZSdt/oV5FQFCj96EpED+J0xCqUcDe99XUvuMJetxP5ONTAspz7exFa8wu
	qhW/YsQLEdZCyV1/nvTS6xbfWs081WaM8m4hJDRt7mm1YgXaObmMa0+e2eVLIPrM
	3TRgkLecskIpBftJKxvm+xevqwlbkDf886iPnkWNfRJqDHyU6UOe/JlC/SGPSl6F
	aGTL2gdYQB3NH1B37+/mpHpyeCPxvLhjTzAImoD7jfXLD65OV+EhUPSP/F/PXW1v
	DHHuxA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80thg2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 27 Sep 2025 19:01:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-32ee62ed6beso4737819a91.2
        for <linux-firmware@kernel.org>; Sat, 27 Sep 2025 12:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758999713; x=1759604513;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6b++rfN5lm5dPSAPZljq8g4oaGNBOgcXQGRXXKt14X8=;
        b=gEbAKXM5pTOERZknq/jMA7OAmLbFPpegAX/sz1g0epV3VZMqyTquD90x7cKfj0nG+G
         PQxaH0we2ydyjgAu+wSJELa1XVsjeClo9MOoaKr8BS7/sgcYcNZECabD4QYWpegkabn+
         7IOJw7qX4aKPPnTd8ZBuiXbXaVSEANGQwPFlAw5bafAELBfrNLw6pHU/PBslO6MGQan8
         0ZfW7Ew0y2r+iYQFXL3c00+ZowG5LbgvBj8dzaNB0uFZvjLuWL9OR9GZZly/k/BlebMh
         T3rz3/x+mA2qREz5kbTSQYjKy2mdYZyihxmE/HJHH4SbtLERxi7e6dFZToo3997jL+95
         uXBg==
X-Gm-Message-State: AOJu0Ywu+NCKeLGNvfv4MjckSmYn5Mf9vY85hG9KGLUzfPKVhjl8qFKW
	Hf4g/SmCu8kWAu2T0fKnFaefAPOlY2TSbSnMbrjuZ0CwKnU0th3l6DAyu+cA38puyxr9n1t/HLc
	AQY4xTR34zUBUxGop/ZWRAU+js7+ES9EOVsad0KeODOrRDcKuIh93sk7v3wIA3z4=
X-Gm-Gg: ASbGncv5jT2tPqpKwdxpX7ySVjt/ivD5PRvU8b03WtcR2SrL2h9wPSRP2N+QtwHQB3V
	WVmM6D/VhyvxaWfGthwZvH8u6HMRKEoQU3oTVMYVSDZJMi7fW4SttzV6QmI4aex+cgEbNZ1KzDa
	NyQmvCFk7/U81/mRKkdgOsXDehcnZFC3ehAOQ6dhtuyE0OOo/fUrTjS30XJZSzZPG4hV0+otyar
	9PhKYz5bbhpV7dBySi94hICjWFjYaoOQnfCnBQLe8GR31NtjNpSDZzWp93E7cMWma6ArSqaKBDR
	WIIuCovWbRAuhYOSF3kfLfNeNZFHEcfsYJzfYkb8ELtlG0U8bJEm4oqRpq9qEA==
X-Received: by 2002:a17:90b:33c7:b0:32e:753d:76da with SMTP id 98e67ed59e1d1-3342a2abad6mr12107407a91.20.1758999713215;
        Sat, 27 Sep 2025 12:01:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9Rv0Ei/gfBEtay6dWnpjBeZCFTUjPOiryX5Rtgikyh9tjIs6bbDr96efkcIznTEgJFoo89A==
X-Received: by 2002:a17:90b:33c7:b0:32e:753d:76da with SMTP id 98e67ed59e1d1-3342a2abad6mr12107388a91.20.1758999712723;
        Sat, 27 Sep 2025 12:01:52 -0700 (PDT)
Received: from [192.168.1.9] ([117.244.78.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bd90332sm12323735a91.1.2025.09.27.12.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Sep 2025 12:01:52 -0700 (PDT)
Message-ID: <b2f9025b-2016-4c95-8d73-49eb91b3761b@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 00:31:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update GPU firmwares of QCS615 chipset -v2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <d2e4501a-937f-413d-a58a-1a461c7947c2@oss.qualcomm.com>
 <cefhytvrazclwp3qicixaf3wh2p4vffhakt62of4cqua7rj7ok@r7gdz3nhgo2p>
 <27ae02e3-bb40-4bcd-a74a-eb228833add0@oss.qualcomm.com>
 <pnhpmwpdnhkexejum5zriq62wj7y46ot4elrlvcvwpmmfvk4mq@lskjszqjyedx>
 <CA+5PVA4=8c+_ocTJbzQ_vZCNUseZbjRoaqs0GZonVYt4KWPTWQ@mail.gmail.com>
 <15ad368e-0d36-41c7-a9be-71d08ba1efe2@oss.qualcomm.com>
 <CA+5PVA4o11_BisRiNYZhMoWR7Hyyrg7Qu6ZrxJLxraFoz2NThA@mail.gmail.com>
 <7gnlc6wv5t2livvvkgob7qqyjswcr6bpo2fbg634hpr4o7d5hu@ixozfvql2mis>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7gnlc6wv5t2livvvkgob7qqyjswcr6bpo2fbg634hpr4o7d5hu@ixozfvql2mis>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfXzLeNeCbz8fKV
 dsMlb39Oa1f0BhzY7T7IoFNF95N5xYCbp5UCkdnwBIKaZPs3FN1sKOU/b7744WtByMn3VdWtMPE
 hd7tE4Iwt6sqk5XGLIzkqR2t0nGXUBlpj3r8Gh2GlmMDyVGlTYhQulLl7Eo2V+uCsabJ+joSxgY
 x0dxP416xLZ7cjkEiL9nhbOyAkywg0tQhioyUKAx+LLbjyIfBFGKUdfEucFdkoFtAj3Xk7E5Bt1
 34JjPOEqHxKqzCEzdFqd87TKeiD9z4AkVOcF03e96Uv7tLVcl6sy5qddc94LqcvCKnyNHc6efnA
 PRQNpHiGbg0/B4i5EKlr5TJRd06PAQbiSg15T4Ahva4R+M0ooLnPu9/FukoPxEDyZn4yONSWAny
 tYVuOGhcIHfRVDQA+S7Hs85EbWkmsg==
X-Proofpoint-GUID: NHnc97hizMH1nLlfrhkmPFn6dlL26Tkb
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68d834a2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=KU03pyq4eEOZfaT5og2c8g==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=p0WdMEafAAAA:8 a=qC_FGOx9AAAA:8
 a=EUspDBNiAAAA:8 a=WbfBmYpsY9zsuA-9mrAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=HhbK4dLum7pmb74im6QT:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=jd6J4Gguk5HxikPWLKER:22
X-Proofpoint-ORIG-GUID: NHnc97hizMH1nLlfrhkmPFn6dlL26Tkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-27_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

On 9/21/2025 10:11 AM, Dmitry Baryshkov wrote:
> Hello Akhil,
> 
> On Wed, Sep 03, 2025 at 11:25:22AM -0400, Josh Boyer wrote:
>> On Wed, Sep 3, 2025 at 6:26 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>
>>> On 7/16/2025 5:01 AM, Josh Boyer wrote:
>>>> Pulled and pushed out.
>>>>
>>>> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/613
>>>>
>>>> josh
>>>>
>>>> On Tue, Jul 15, 2025 at 8:16 AM Dmitry Baryshkov
>>>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>>>>
>>>>> On Tue, Jul 15, 2025 at 11:58:08AM +0530, Akhil P Oommen wrote:
>>>>>> On 7/15/2025 3:54 AM, Dmitry Baryshkov wrote:
>>>>>>> On Mon, Jul 14, 2025 at 10:55:03PM +0530, Akhil P Oommen wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Add/update the gpu firmwares required for Qualcomm's QCS615 chipset.
>>>>>>>>
>>>>>>>> -Akhil
>>>>>>>>
>>>>>>>> ---
>>>>>>>> The following changes since commit 99d64b4f788c16e81b6550ef94f43c6b91cfad2d:
>>>>>>>>
>>>>>>>>   Merge branch 'amd-ucode' into kfw (2025-07-08 12:00:49 -0400)
>>>>>>>>
>>>>>>>> are available in the Git repository at:
>>>>>>>>
>>>>>>>>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-QCS615v3
>>>>>>>>
>>>>>>>> for you to fetch changes up to 6907a7a381dd13d7fadc3a480ad470151c3f3782:
>>>>>>>>
>>>>>>>>   qcom: Update gpu firmwares of QCS615 chipset (2025-07-14 22:47:07 +0530)
>>>>>>>>
>>>>>>>> ----------------------------------------------------------------
>>>>>>>> Akhil P Oommen (1):
>>>>>>>>       qcom: Update gpu firmwares of QCS615 chipset
>>>>>>>>
>>>>>>>>  WHENCE                   |   3 +++
>>>>>>>>  qcom/a612_rgmu.bin       | Bin 0 -> 3072 bytes
>>>>>>>>  qcom/qcs615/a612_zap.mbn | Bin 14256 -> 14256 bytes
>>>
>>> Hi Josh,
>>>
>>> The latest tip of 'main' branch doesn't show this file. File size
>>> is 3KB instead of the expected 14KB. Any chance you might have
>>> accidentally pulled in a wrong PR?
>>
>> Perhaps.  I suggest sending a new PR with whatever fixes are required.
> 
> Any updates regarding the ZAP shader? Would you send the PR?
> 

We have a bunch of new firmwares in queue. Will fix this too in the same PR.

-Akhil.
