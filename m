Return-Path: <SRS0=041a=52=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19B6CEE347
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Nov 2025 18:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B442C4AF14; Tue, 18 Nov 2025 18:10:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CD9AC116B1
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 18:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0CD9AC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIE1HG1384205
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 18:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJujh81Q3s0BhkCTFArtcrXMZMSiAMRc11r2Tf3EAx8=; b=YuTTO9rU6KD2Xyka
	Zm5/bRsi7DOLjg+3gA94KMUulVfj0JpUTXNQ9csvQJAGt+xN7IKUZKEF4Hbn+h3s
	BnVooWw6lUNGI+CleuCnKcVJQyVRhuGowPbjsC41284HsuRxH06ojS+dDvMp5aMy
	yY6OpAwYqXUCj+08v1ZXh6cEw4r0zHrAT8q40n+qL6AxUUOWxnqFFYVIKci2dhgj
	qIibALnjV2T5MOn/Gm8qYcyNNGUGlYQ7i1XX9SJcFzUE4wgvtKSCtMryQDeVR6Zd
	WcdFs7ZNlj0zIGNe6ntdA5F4ZlUvJZUg0OeUIXXgQZGUvYLZApJBgGQQokqkTFpk
	ZExafw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8kg8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 18:10:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so8117578b3a.3
        for <linux-firmware@kernel.org>; Tue, 18 Nov 2025 10:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763489438; x=1764094238; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AJujh81Q3s0BhkCTFArtcrXMZMSiAMRc11r2Tf3EAx8=;
        b=N6MZLM5ROZKUuCkwgxHPwUCzDh3KSPFIyZYs76jZ8xgsYahZ6Ld/OUFF9rMmVDazRD
         yhIqa+RlkZvHKoxXo1n26leEFMdibux9XHNfMeBBU55htfohrYbQfl9d8PxzGOjruydB
         c8TCDQxRtEs8hT7uCOM5LpOhZQEPr1MLA5FiP+7geSWU+eXo5OYdT7XgUcCKmndj7K5a
         0tbkHJMA0OHVcDicg/N4nt/ARArn877dELAOsjx7F9APJkhuud0h2eWQ9D1RAgbOh2J1
         31/BaEGIZE7+kvR5Ibo5q6RL5rz1oC+yz1KjhWTVVRQId7HEzRTkBs/S/ejHu5woOLLb
         OLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763489438; x=1764094238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJujh81Q3s0BhkCTFArtcrXMZMSiAMRc11r2Tf3EAx8=;
        b=J0xexbADrQZBKr8gcGUrKvUv8CTBtT3qyBGnNj6NyfK8E2wsRngRLzlXNazB/kB1fq
         21mt91yGQE/2MGMZ8dWudWgEg/FrmH/tcUXudf/2HVwHEnV/H1Tjsmcrje5NdYcjVvFm
         +DeX/CPoEu9L0YTJ6URkbtywBJSBsBEFTL9KophRC/pcSY829eeA0ewAIbAZNCuHJgyc
         zOvNnfpfRyIDambwdtBpk9lmtBTkLQQ4ZtUQmoF+pqO0p8dc+l1EyPZDGM1gOUhdBDN/
         uNur+y9F44zWkJ5o1n1hEBOPVEDW7euqmLvfRBnam212j7WAmveFYWq8UVYNTHdYIx1M
         gRhw==
X-Gm-Message-State: AOJu0Yx/93V4ugdwPu2I6306+JwE81+QxEiQD+oysRrBm1K/hzcZZDps
	3PLVe/vDhJSWc8uOMLZNPtMeFfQlEHPpBsjtOPMpTum9qP3n/EkJf26WEDnH0wv3vuWFi6mDpKG
	ODrpgLKmAkDAJ+lfMDmMB4KMXxZUfoy/fs0my54FcUKb3eT5FPYF2Sv264x5FLn4=
X-Gm-Gg: ASbGnctH8OTILjrw+FefabCPgi6eb5l3+Mc+LZKrdZ79VBwWp6yit9HEf0+UdhQ0BA5
	30S1IFGPMXXS1w0Lfy+Y+DiUOLLXdj2XwzV73Zmcsfjf1za98XISmHh6Q7HRuO5UqJC6B9y8EZ5
	wDRKNWHGi4AAJ35weh/nb3psnQF4GfSDklMckJR6x0IfRHpk6e98tv7fbWkv6S9Bvhadaz/AwBh
	QhrtDQtfB/jDxbKPWKJhZ3391nssC4XspsWwzjWNcOE/sxoRu1b7ZZloEqG08EedLyqRINVIfW2
	bHhqMMPxfBRD5iwDrcuGcbmGuZrD8DTMes+LY0zoMgCPTlk31TFj/awgtRZGNKmp9DZ+z9a8UyW
	5IMhibUuh1/uKP+GdNDKOkOOsL5eB2N1z6fiK/i2rnw==
X-Received: by 2002:a05:6a00:4fd6:b0:7ab:78be:3212 with SMTP id d2e1a72fcca58-7ba3be8c659mr18376143b3a.19.1763489438083;
        Tue, 18 Nov 2025 10:10:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFT4g93+ZP2SZEtx18OCUV0gNRu1EfScwV6cfN+4ClwWbyfvFyNGyNK7f4TAeRV3Bl3EbC60Q==
X-Received: by 2002:a05:6a00:4fd6:b0:7ab:78be:3212 with SMTP id d2e1a72fcca58-7ba3be8c659mr18376114b3a.19.1763489437612;
        Tue, 18 Nov 2025 10:10:37 -0800 (PST)
Received: from [192.168.0.202] ([49.204.103.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b92714fc5bsm17121611b3a.48.2025.11.18.10.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:10:37 -0800 (PST)
Message-ID: <d3646263-0ffe-4a16-9baf-81202d481ea8@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 23:40:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: Update DSP firmware for Kaanapali platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, kssb@qti.qualcomm.com, psaddam@qti.qualcomm.com
References: <384a6882-c95a-499c-9bcb-35af092118be@oss.qualcomm.com>
 <a067192f-ec95-4cf9-89a9-e1eefffcf166@oss.qualcomm.com>
 <ypeyd37oonsm55cenq5xl4lpxtdyhuqlt2nlgweottnwagujjr@v54m5ki367wl>
 <c5de392e-9c65-4021-b7e7-3a81329f170a@oss.qualcomm.com>
 <CAO9ioeVYMOR_+QdkQk6YM0YdH0Hvi+TjmUfQ6-X7=nLfnG9JbQ@mail.gmail.com>
 <3a84fa28-e4a8-4875-b655-293011d3ce63@oss.qualcomm.com>
 <tqpvpnh7f2gbkhw733aux44vzfcd6fd5i4e55zxidj6rl7jafh@6y7776gkbgyf>
 <217efcc4-2b34-4c57-bdda-16adc064a5ed@oss.qualcomm.com>
 <lxldmx2ulavqsijroufa6btxf67t2bocjovnjzxeeqbdd35ri3@dhouz4i7so42>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <lxldmx2ulavqsijroufa6btxf67t2bocjovnjzxeeqbdd35ri3@dhouz4i7so42>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NPPu0KapvM4QC7tCatecsVv1GpVt9ART
X-Proofpoint-ORIG-GUID: NPPu0KapvM4QC7tCatecsVv1GpVt9ART
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691cb69f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ESLlCZJ65S52b8JmbLwmNw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=EUspDBNiAAAA:8
 a=MbBTozEO2mmEJhO0kcoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NiBTYWx0ZWRfX5mrPsGFmdW9H
 keDdgKgn57RbmMTOTaDjCeQYYz2PtcIxLy5YZIIkbwcgUGRBvuHX/x4bzy9pPK+gw6WKafGO/8x
 1HPtMCs84qsmHp/xVf7rix7I756/GIOutXuzBGzHKH+cevO20K4dtMrxfRsGakNd+pl0Z5evWCR
 D53wwk4iqjRYgWoM/8prfCfxLSREdWhVKgri+e8iSbDNOgdUn0+BbOyxBcOuYcO8sal8yXgbOGK
 R9JRwJYX3TCPfVP9bvFHwG8+4Hq5KfxyPJXbcPJJObrZnpEva4P9+jP3Ubgui6NkXlA0LJFx9Bf
 4VUMwtAUS5kyDz7PmyfakBzTcZ/RRQF1/Rva8/BK7TpS21rlp24uVotwB3GAAYtaX53aa6mhxB9
 WPRMSbtqhDcU9FmBck35Xq8QHvyvAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180146



On 11/18/2025 11:26 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 18, 2025 at 09:20:23PM +0530, Venkata Kota wrote:
>>
>>
>> On 11/18/2025 9:04 PM, Dmitry Baryshkov wrote:
>>> On Tue, Nov 18, 2025 at 08:05:04PM +0530, Venkata Kota wrote:
>>>>
>>>>
>>>> On 11/18/2025 7:56 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 18 Nov 2025 at 16:21, Venkata Kota
>>>>> <venkata.kota@oss.qualcomm.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 11/18/2025 4:28 PM, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Nov 18, 2025 at 10:24:03AM +0530, Venkata Kota wrote:
>>>>>>>> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
>>>>>>>>
>>>>>>>>       Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
>>>>>>>>
>>>>>>>> are available in the Git repository at:
>>>>>>>>
>>>>>>>>       https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>>>> dsp-fw-kaanapali
>>>>>>>>
>>>>>>>> for you to fetch changes up to d6afd7f0d0c9f4649880f36eff7a5fe4ef0386cf:
>>>>>>>>
>>>>>>>>       qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
>>>>>>>> 10:20:00 +0530)
>>>>>>>>
>>>>>>>> ----------------------------------------------------------------
>>>>>>>> Venkata Kota (1):
>>>>>>>>           qcom: update ADSP, CDSP firmware for kaanapali platform
>>>>>>>>
>>>>>>>>      WHENCE                      |   4 ++--
>>>>>>>>      qcom/kaanapali/adsp.mbn     | Bin 19879944 -> 20703432 bytes
>>>>>>>>      qcom/kaanapali/adsp_dtb.mbn | Bin 184120 -> 188216 bytes
>>>>>>>>      qcom/kaanapali/cdsp.mbn     | Bin 4956632 -> 4960728 bytes
>>>>>>>>      qcom/kaanapali/cdsp_dtb.mbn | Bin 40760 -> 40760 bytes
>>>>>>>>      5 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> Should these files be covered by LICENSE.qcom or LICENSE.qcom-2?
>>>>>> The files should be covered under LICENSE.qcom-2 Made the change to the
>>>>>> WHENCE file to reflect the same as below
>>>>>> The following changes since commit 53adb2085ca81337df2db20b96898b1980e310ff:
>>>>>>
>>>>>>       Merge branch 'aic100_1_20_2_6' into 'main' (2025-11-18 03:16:11 +0000)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>       https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>>>> dsp-fw-kaanapali
>>>>>>
>>>>>> for you to fetch changes up to db069c95dcc16ea84dacb80488464e843ea252cc:
>>>>>
>>>>> You've silently changed the licence without mentioning anything in the
>>>>> commit message. That's a no-go.
>>>> <Noted> Made the change to the commit message accordingly.>
>>>
>>> Could you please add a word about it to the commit subject too? ('update
>>> firmware for kaanapali platform, change the licence')
>> Updated. Please Review.>
> 
> Now, why do we have two groups for kaanapali there? One with soccp and
> another one which you have just added.
I am not sure about soccp FW. DSP team does not track that firmware. Do 
you suggest to have all of these close by. I was not aware of soccp and 
just add Kaanapali fw below the rest of the DSP FW.>
>>>>>>
>>>>>>       qcom: update ADSP, CDSP firmware for kaanapali platform (2025-11-18
>>>>>> 19:45:11 +0530)
>>>>>
>>>>>
>>>>
>>>
>>
> 

