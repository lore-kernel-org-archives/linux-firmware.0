Return-Path: <SRS0=ruOp=7R=oss.qualcomm.com=vivek.sahu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE29D2503F
	for <linux-firmware@archiver.kernel.org>; Mon, 12 Jan 2026 07:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10F07C19423; Mon, 12 Jan 2026 07:19:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 250F2C116D0
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 250F2C116D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BNAZY64175989
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:19:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmzJq/F5LBW198qBfjkHnfbo5ejrSUyDszaZ+nuO/qw=; b=gG4MSW+MP1lR/spJ
	KzNuG1hOpXCucu6467UKRTnql8ihXF6MTVGlhh22EQu4PChS5v2OVjb7i898T/Za
	YWNKm6B+3scMTqiKM93+lHgpD+2UKTFsEUdcGaqQKRnwpjHO0tBaWT368SrkvkHt
	uEBGIRiFP1MXM99V2rzaNh+LoR345BuzHjprkBhc2TycFwapACcJaPb5baANaxEv
	7OSmdeGhsw1p85rkr+gdvZSWotmd8uxignSbXJ7zOMN9rBkfoVOkL4KBMGH2kM6T
	KyCDS0GQcdJFTkBGveM2CSBujD5CXb2F/S4+Ep+cL1G7KCvj3isrQ/8sPIB1fDcl
	+0d7bg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu3yj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 12 Jan 2026 07:19:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c52743b781eso2366363a12.2
        for <linux-firmware@kernel.org>; Sun, 11 Jan 2026 23:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768202359; x=1768807159; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmzJq/F5LBW198qBfjkHnfbo5ejrSUyDszaZ+nuO/qw=;
        b=V76VY/OUakrm6X1/nMWpEP/5T1LnAMrM9gbh+8eH9w0f747sAtG1JKN7xyVzBbUgd5
         qhJAOUK5qrHwsb+UCRQiVdKiVs+qyC9aruaZYAppBJbXvLJOtMa4z/jsFiVP+hmKfNYg
         XY1qjxGQHVQusLSSrL2bBfQ9MIa4snBLOJXjdoJ+hfcUXRGP4fT6pIVpTkPmfdyGPsPU
         2cIBR/w1oU3p7i9OW3BtahbdtJtggRIh7U5o3wF1iBLmCnMUiC5rTljkatbZZfLBzOI0
         kjdj+b1nR/t/rgEmrFW3rjU9q/OpUWNPecOkejEpnPEu77GRnf+SaaN0dKglonLkpuMe
         L0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202359; x=1768807159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nmzJq/F5LBW198qBfjkHnfbo5ejrSUyDszaZ+nuO/qw=;
        b=WHQOn5IvQ+KdiaykqB1cRT+vtJBV7LuP0BTaHqFrXChMDQMgIGfDSdT+XKlFyYItqa
         QjUtnNtRfeT/h0no0ylul/NRWRh0gXnBZDKvIMSPnbzg6p2wxeDcHWmOuPA/aq0Cq5k0
         QPfPLWUyaHXN7uIUNgY2I02hrdCp/4vsQaQ5BqA/BHoqJ/MsLJLurMFhm0dc49UAZUUs
         q0R2Pf5EAKaocN8grF20XSmTLC/UOB3Huw2Cyu3hax7I0toZyjbf56PYwvstVSNgCW1G
         FNgX3XecfUDIZBOV3MWUorZjJJlHmOb3kP1jztxV1he3VqwoK2/9AMlRG2UYsuuqZSAs
         c6Nw==
X-Gm-Message-State: AOJu0YyfllR2BmzPbclZEOSplNoU8uyhCxfX/4UWrG3GjjurDuDVzW4n
	vycRVyng26Dt7Qawj2fc2+6gu0SDeMYs9P+8RT0JgGSzZTvEd3tHWUvz2M0rNSkz5PL2TkiHkK+
	TQM4M6OwRzmrx48JR6jTgknWcRyADodtBYMtdJujUbgJTtyOst+dS+8onPGA44yA=
X-Gm-Gg: AY/fxX6xAlX12L6ihiMpYmS66EZUfzPXjgGT+wjILftPmrwFUDsvCFYuAZbhozMtpXV
	5p7uSofhbeGU/dDy1meIeJpiQ2kXicloC/fszmEym5OvIosKNujgmQuDJo/0p8e1pkSN6AsRyvs
	IDLX8SrmmMxScxjindNGWqp2FSMJMDrTCkaItHTvQl8DOg4KLb3BqYD9vlfvFzvb3mHAA6KGV16
	8zN7pg/h9B2pDH4RUtiwLhS2BygL0lwtO+YRxznX5TZuwssF+eYBy1k5M/9lARr+WiCe/kw/kZt
	d3RO2pBnY/jh+cdaQ/5r8MQNDDHVO9MNq3DY/Z9oVlzumsT45wHny3gARIkfkkMBUl6BrdkTfP2
	H5X0mOsEgY8SIZz4aQiuHPbIVz0YR5DWPwI3e
X-Received: by 2002:a05:6a21:9998:b0:35b:c903:1db3 with SMTP id adf61e73a8af0-3898f888ae7mr14999840637.6.1768202359513;
        Sun, 11 Jan 2026 23:19:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDBHMfSeQspTCzBYDoxlCNU2q5FxuA+jqK6kkZ4YANnf3a5Ay0+lq3r1LlDrUt54xg4pL7fQ==
X-Received: by 2002:a05:6a21:9998:b0:35b:c903:1db3 with SMTP id adf61e73a8af0-3898f888ae7mr14999822637.6.1768202358998;
        Sun, 11 Jan 2026 23:19:18 -0800 (PST)
Received: from [10.218.16.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa955f7sm16859389a91.8.2026.01.11.23.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 23:19:18 -0800 (PST)
Message-ID: <8ac21cee-babe-4854-8e53-16772504c22e@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:49:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add Bluetooth firmware for QCC2072 uart interface
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Mohammed Sameer Mulla (QUIC)" <quic_mohamull@quicinc.com>,
        "Harish Bandi (QUIC)" <quic_hbandi@quicinc.com>,
        quic_janathot@quicinc.com
References: <ade99252-a85c-4399-92f1-56156f509814@oss.qualcomm.com>
 <iep7i32ovru6j42fx5l54rmw3ihhoetd4isvwpkvvwlekujcx3@ytwjeawwqz6w>
 <ead2a8c2-c466-4f37-a9db-79a54bcd6a22@oss.qualcomm.com>
 <psonfqdp3driwwuo3ihs7u5cclt4exo6khaapyd2wlagcyq3ib@y4cratso4m7v>
 <64b48dc5-165b-4a90-805f-37f76bcc352c@oss.qualcomm.com>
 <CAO9ioeW6de4VJARv8RYid7H3cLCYXT+ZwLAay4wjcWCjKwpWQw@mail.gmail.com>
Content-Language: en-US
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
In-Reply-To: <CAO9ioeW6de4VJARv8RYid7H3cLCYXT+ZwLAay4wjcWCjKwpWQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _nKRlXywk7VteWnDHX2m4fzK_ucSCqSz
X-Proofpoint-ORIG-GUID: _nKRlXywk7VteWnDHX2m4fzK_ucSCqSz
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6964a078 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=sioj1Qjf9xq7bVqP1LMA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA1NSBTYWx0ZWRfX6MxXQdFQ8ga/
 p6IpW8qa6ju1NZaWDZ//97ZqqPGwkXA0tiuT5yeFSLa+7kXivo5t2I6OiOyJ4VG83Skru6uALUR
 xLKgkJjs5n74L/Kj1SlujuvnNWwCyziYU36nKlx4DHxGa5DoJfMq5/nS2YA4MDsIG4uCRM0lNn/
 UOV0bOgLagLtyTcoqUoA9Wzj8raWeFO2hG8H/RJft7itFqr4nb6/MGiHne0qZhuAZUv9o2k+7To
 9KQk+7IesJXpDeXqeu5YP3RTAZm15E2LLu/e0/I51jvXPAL/bz6HwmtIjc0f9IH7/W8S9GDG59K
 aNl4f7RA7jA9lHaKDC/EO8xgaIKmDxwKPIuO3BY9AS0lo51n2N1gzWC/BK6GU4ElPPDtoZgKKNU
 VIPf9UKXi9U4oHQdHKHzsWEHg9PByVqfntbI8w1ukJibjTxtBIp6FR+yP02Fm0ssP86eLCxtpHC
 5T7tW1oQx/bvJwNRK0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120055


On 1/12/2026 12:46 PM, Dmitry Baryshkov wrote:
> On Mon, 12 Jan 2026 at 09:16, Vivek Sahu <vivek.sahu@oss.qualcomm.com> wrote:
>>
>> On 1/9/2026 4:46 PM, Dmitry Baryshkov wrote:
>>> On Fri, Jan 09, 2026 at 12:24:58PM +0530, Vivek Sahu wrote:
>>>> On 1/8/2026 6:18 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Jan 08, 2026 at 02:33:22PM +0530, Vivek Sahu wrote:
>>>>>> Hi linux-firmware maintainers,
>>>>>>
>>>>>> Here's a pull request for btqca bluetooth driver. Please let me know if you
>>>>>> have any problems.
>>>>>>
>>>>>>
>>>>>> The following changes since commit e272e0d1edce58496c3917f7422b9531daeb0535:
>>>>>>
>>>>>>      Merge branch 'robot/pr-0-1767725013' into 'main' (2026-01-06 19:05:06
>>>>>> +0000)
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>      https://github.com/vivesahu-huboss/Cologne_FW_Upstream.git HEAD
>>>>>>
>>>>>> for you to fetch changes up to 5fce4edd5a84b09c670918cfcaa0705eaf1c2b60:
>>>>>>
>>>>>>      QCA: Add Bluetooth firmware for QCC2072 uart interface This commit will
>>>>>> add required Bluetooth firmware files for QCC2072 uart interface.
>>>>>> (2026-01-08 13:20:45 +0530)
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> Vivek Kumar Sahu (1):
>>>>>>          QCA: Add Bluetooth firmware for QCC2072 uart interface This commit
>>>>>> will add required Bluetooth firmware files for QCC2072 uart interface.
>>>>> Oh. And your git setup is broken. How did you end up with the SoB not
>>>>> matching the Author of the commit (yes, I really want to know, how).
>>>> my gitconfig file was not updated with oss mail id leading to this issue.
>>> Are you writing the SoB manually? I'm asking because `git commit -s`
>>> would use the same Git config for both Author and SoB.
>> Yes, I was writing it manually.
> Why? `git commit -s` does that for you (add an alias, if that's too
> long to type).
Yes, that is the right way of doing it. I'll follow that next time.
>>>> I'll update it in next commit.
>>>>
>
>
