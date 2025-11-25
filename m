Return-Path: <SRS0=5ycy=6B=oss.qualcomm.com=wei.deng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113F6CFD364
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Nov 2025 09:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC11AC19421; Tue, 25 Nov 2025 09:58:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DDEFCC116D0
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 09:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DDEFCC116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2gdTY1847609
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 09:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gpk7IWEl9DjuAv+KiHz1yVkOxeaIxLHvZPtZOvPYOKo=; b=aUpxhVzQTL/cRVQu
	mqjbIgTwDz0Zna+L+NmANGT9Wdb8ysu1jGaic816wXe8VR6BmP/RLXgbh5H6AXNu
	QR4JMYoLybYkjhr1+/pLXcFW/9bzFgGH+hFSyC8E/CobRim3b8w1feUoBIMv3FyI
	tyIyFD+O34cbhf4USr7FOvi2OC/GUnSo0blLH28ZbD7YepEZvnsORZWlfejNPSNc
	IeqUwnk/ydcPyRS8+97jmSI6jZ2l5gZh6VAeYn+h6FoMIhn7gsHD7HAaQMA/1GPj
	2S7z89h+Y2tpLGtr4pIfyaZsSFzIt1qkMJQxLyOTmYnRjegfbdlKw6c5+q0+sd20
	AzjiKg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6qanug-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 09:58:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295ac7012acso27586895ad.2
        for <linux-firmware@kernel.org>; Tue, 25 Nov 2025 01:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764064693; x=1764669493; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gpk7IWEl9DjuAv+KiHz1yVkOxeaIxLHvZPtZOvPYOKo=;
        b=MprwWjgDduClRhIyBvvKMEgiZL/88YAGsZrnUIqvTbNZnm+M71iVUpueeUEJFCAx/A
         P3kcjSLjVLW/LV2rygIYLZ3Ar8atDFdTvMO6Z+CNAp0GpC3aVvzLmOO6pGjjEYDeg4Sr
         dnnh21Ljr3FJDhkVXSClusX5Co/q09FRRjmVdQqds6kfA3jhFMO1TwyHQe8+ugGjaElY
         YzaVZvph5RBzr20f6g7yriOtj34Ms/gXS+k0pzg1hMgySITBS0GY43WId1hbWAA1sYPp
         rMS3FOsAxGJXjblLY55VpbXEl+Bco7zW8ifU+wPnbvQw6dW5I8CtVGf8Z3aZeIAUSu/n
         t3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064693; x=1764669493;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpk7IWEl9DjuAv+KiHz1yVkOxeaIxLHvZPtZOvPYOKo=;
        b=AFY782HOCb/j/EmzVtmS5fFO7fOC5/i1/kla84MmBQ4c0PTi/Y6oj1lFhbOd2DB2c1
         FBe02EkD6e5arkiZjc8MJMPKIZ2fMMeGbjiZfDsE8gr39wgcuRxso1Lz0X+E+nmbvhKU
         JAmRjAFF2+SZQ2y2Wby8Pe6DaWJ8fiibSn/+Uhd7yvU39LlksNWZVOPfLN78dZa/3zTA
         S5Nx7vBKIb+sIthws3AR+e9+BRVRHrZ/bmjadyllYClWmg4WPGjeMYY91rRYC0OgYTYr
         qS4+aDS5B7OzCkqvexYQ3VYDY6/Ub4NrAyiZeTrZWO3oNuqk9xraVdrzlK6V4PPaVy6d
         3lVA==
X-Gm-Message-State: AOJu0YzURwNtWMCb3b1f4peyi5GpCetbQrGJ4MqBFBNkcyiWiYWrc0Dk
	06ncOlqPWBs7H4gN6d+R4dX8R5jSoqw3ntn2Vsx02X25Crpc4MpSyLwM7l+4qY3Ev9mkGd7qZul
	kVu5TtJKr7N2OHFjyi84XI55y4t0sxr/pL0OzhoDXmNvYEdGC/cYIBW7aLjqWO7o=
X-Gm-Gg: ASbGncvXQPWuxKqhDQQ1qXRtgjLHmW2k90BacqU9GHy69UouKuDYBSI146TOG1iAuOJ
	HOkjyzwf0aIHpgqcMzDcpN9UNenIBeSwjfI+7iRAWw5j1GcBvMiTETfxw4pLiOOEIZPrJwrHlzS
	5uxFurMPh9VgVUgHvSLIfO40emTeghsdeQnOa0d1qcv4Y+XOiTEpDPIHtA4XnlcMNMntTzl/8UL
	uroG4viITzXIuWeoY919Dd2S1gkruI2XzvrkWlJz1oeiOeIFTXRaL3ceToZVIrfA6Uo3ZDPd6aw
	3J1fBaysEwBJ14XWKFucggnD1A3NlkRQAn2tEhhKYgx4aGD3deLtqRyCioiWylhRyxETXy88Szn
	BkFiFbRWz/ZSLS21F5nuGoc5+3efvmQ==
X-Received: by 2002:a05:7022:ea46:10b0:119:e55a:95a1 with SMTP id a92af1059eb24-11c9d8678famr7200616c88.3.1764064693382;
        Tue, 25 Nov 2025 01:58:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqXg1poeCD6DPjCtmi4FQ3vwlARmf4ZPSHQdCMffDfmBBepl4e5iWbqzRDQ6ccpXgnt8nIvQ==
X-Received: by 2002:a05:7022:ea46:10b0:119:e55a:95a1 with SMTP id a92af1059eb24-11c9d8678famr7200601c88.3.1764064692746;
        Tue, 25 Nov 2025 01:58:12 -0800 (PST)
Received: from [10.239.97.27] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e6da4dsm74262607c88.9.2025.11.25.01.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 01:58:12 -0800 (PST)
Message-ID: <bba364f6-f176-4d7c-ac65-499a91f1cfdd@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 17:58:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmware for WCN685x uart interface
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
        cheng.jiang@oss.qualcomm.com
References: <897a0b73-8903-42f3-805f-1c568c93feb5@oss.qualcomm.com>
 <mnhlpuus5ply2r3wwbv2qyaqz3mpdawrky4ee6bs4ciaefnz6x@7c3wfjotzvxx>
Content-Language: en-US
From: Wei Deng <wei.deng@oss.qualcomm.com>
In-Reply-To: <mnhlpuus5ply2r3wwbv2qyaqz3mpdawrky4ee6bs4ciaefnz6x@7c3wfjotzvxx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F0pT-Xay856Dn0pMROJExgYAB55R39ox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA4MSBTYWx0ZWRfX1h5bSxGRmS4u
 1QAoS22rKIaObR9+ADgTXU4+p+K/S0gzeNByiipMGzxhhCwaeEFBXWNaObp6b6oLNBC7ANFcWlo
 a7Is+jD1GjfGulrEVQ9Ben3lDLzz1DVRVN70G8J1E2EjvXJ2Ku/JqVKaFrTa82ZtJ6A688Ylysh
 j+aE+TPWma0BwFKmp5E7NnzUCBhMQYu6lcS2gsS6YSp0+OnoIusW0xwYC4ni92EPqBwfFvGqEGR
 +6fFjKMvD9b/tvlvpAnRkgMpWba6WoWM6w2PSvOgHMuaULf/buS/eb0E09ut6VadX+aXZuQ9zrN
 1a20tu/bJHqpYNDgAIIJGBWfhNW36W3ZfB0wqlU0jaJNRORN6YWPJM75zDmBzULI5FORX+FFTW9
 DNMd7nGEjfAfSX4OXNunh3J1YbdMDg==
X-Proofpoint-GUID: F0pT-Xay856Dn0pMROJExgYAB55R39ox
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=69257db6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=GeAPFFGAySeOmGo6kvQA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250081

Hi Dmitry,
Thanks for your reminder.

On 11/25/2025 5:49 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 25, 2025 at 02:07:49PM +0800, Wei Deng wrote:
>> Hi linux-firmware maintainers,
>>
>> Here's a pull request for btqca bluetooth driver. Please let me know if
>> you have any problems.
>>
>> The following changes since commit ff6418d185528bb9b040de1066c34fa405ecd4bd:
>>
>>   Merge branch 'amd-staging' into 'main' (2025-11-21 20:17:56 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/WeiDeng-weiden/qca_btfw.git main
>>
>> for you to fetch changes up to 6d5c3fc550a66ec5b778fbc633ab1720a3acbd6b:
>>
>>   QCA: Add Bluetooth firmware for WCN685x uart interface (2025-11-25 11:06:48 +0530)
>>
>> ----------------------------------------------------------------
>> Wei Deng (1):
>>       QCA: Add Bluetooth firmware for WCN685x uart interface
> 
> This wasn't tested on your side:
> 
> E: qca/wcnhpbtfw21.tlv not listed in WHENCE
> etc.
> 

Will add fw in WHENCE and make check locally.

> 
>>  qca/wcnhpbtfw21.tlv | Bin 0 -> 152784 bytes
> 

-- 
Best Regards,
Wei Deng

