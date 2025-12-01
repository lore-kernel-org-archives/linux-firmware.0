Return-Path: <SRS0=uh66=6H=oss.qualcomm.com=yushan.li@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BE9D111A8
	for <linux-firmware@archiver.kernel.org>; Mon,  1 Dec 2025 07:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EC750C116C6; Mon,  1 Dec 2025 07:14:42 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2F021C4CEF1
	for <linux-firmware@kernel.org>; Mon,  1 Dec 2025 07:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2F021C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AULuk602080040
	for <linux-firmware@kernel.org>; Mon, 1 Dec 2025 07:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aITdQ0Q60j1EqChlPGgrD3Vk+bt3f0+rWdQn3nLoax8=; b=FlGKQNjE213499O2
	VQNohuPaAT4GFeUw+xcI+1S3RUgRZz+2QaYunCE5H7Mb+Oijvn6q/38hFrVkCYAo
	Hg3oUKZh+5XnfSeBNxaLI5zUQgO0VZqepZTwNKYcQ5+gLvYl3Irxs8/Ms60bBa18
	kWfwdwMlB3tgF27hxsoPt4gY9vshor7qz/SyAI6AQwHGhtuHbY+jxxGTXth5RAKz
	dJ0vv8LDBl8e6v+Qe5G8mmYWZ1Oe+zqsIq1MgtH0MezU2daxWmZec0UpEpsXfdF1
	ptRFfqibCQhPa29kX0Kpcq3RTXKuzMmroJ9ynjgoIMaRGcBIj42p7QfBtDNUSPiB
	SC6XDA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqt46bp7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 01 Dec 2025 07:14:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7b80de683efso5708483b3a.3
        for <linux-firmware@kernel.org>; Sun, 30 Nov 2025 23:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764573280; x=1765178080; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aITdQ0Q60j1EqChlPGgrD3Vk+bt3f0+rWdQn3nLoax8=;
        b=VpbK8G7KhLJ2wQzoZOTIX6OafH5H6JeNXS87uE/mvmd2MPHycGNZ3S35ldcTlFVb+D
         MA27nkgX4ZvL7lk+Wd1QnrPY12AHFd83NkuWSNMUUDq5nC87azr2csnDrbbFQocqCBCu
         dK/JDHCEUqAzV/XBiZkMZ1EKQPs3fFWVR/Z1XFse6gvMgCGmAC0kewEsqSuSivfr2Mw6
         9YwyrS0/GTd93VkiyD0/e+qBG/ZCo2gPb4TAQzlq2hNVZgm1vMBmB586ghYfNB2uMUyB
         uWQBmBEsOOQ9Abi0pOIFxEbL58quToYjbjlgVYOaMLFKBg1sNJZtD7xbGf5oMPCJVteS
         /sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764573280; x=1765178080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aITdQ0Q60j1EqChlPGgrD3Vk+bt3f0+rWdQn3nLoax8=;
        b=iNfQt5wBaLuF8QFhKi32qJyyPsHZsNVO+pcxHLhEvzCPp6TW26GbR0ZpxOhu4BlfMp
         R8ogxkDdPy7NlUvvdQxIWt7cuudxDDJlFjkhfcd7mTkQGiB3GgyZ5kkweWpzecx6qYB2
         qNJCz5IA3BZ7BUy93WAjSD4BFmHoug+xKrorjrWSa0CdlYTu7Y7K0FGsWLYllmPqs5DJ
         hEDvIAd6eDLoIqDOzjSr9hZDyGeNL7gBlQTo9wbfFRnC+v/45r+HHiX3PNiAFjPgqVgD
         /N0JEwhuBUZAAIsAL4r2ttDL7aWkMoUbqS/SIGyVbFLdw68EVoVF/69T51R0p+rP/ETD
         p8jg==
X-Gm-Message-State: AOJu0Yxxc4XyekitH/AFFcbW0a7syNez62LE/9bFRu6rcLP8a1gwN5Qx
	iXwAkB3wZaWXzoCmG6dpkLw1E109fwluRqO3s38bntsJj8UXB1mZ/9W0N5Z+cIhGz/WD9E4W4kd
	hNexCgrS6/u1w+vLYo7UK+mWTIMSo7/QVYetM7drck9R4LuT49NM6qS3PnQEnu8MdRl/OwZ8=
X-Gm-Gg: ASbGncsInOfH7FjOZTdRn9TLZxydzB6rEmVZzjAeqk33PF7OOmFm9D4X4yeHcnsziB1
	TnNzXk2Xj0n12LzBQSovOhsOKTl72OJvL5Q7C/DRvaU5Z8zWStCykvOBCP+XMyPH3zjMIOffJjn
	MtD5H+RKlAzmH1XV/aucbA6hlTdltNo4dn89ZviXyLxDpeJGoFOEIu8NeRilu3QfbTsz88UoPRa
	i7j4g+UyQZKieakDg61ZzqEhB7G9iyiFbAxy5uyzVwjsYNRrY+3zsHK9X6l1e42zgGaTfllkGdo
	4aCyOA+XH7Lb/46VmbERo+DitIwVKQ1U+J5WTqAl6o8zRXX0HtbAoUCiPROf7yghSMml1W9bfwJ
	nT0uppLa+aPxWcOLLAgnZcv5kvVyI448Xmpy+x+v/CjWXJpTQDV0Urt0z2aqGykNN+zn4VnR6/2
	13
X-Received: by 2002:a05:6a00:2e0f:b0:7ab:3454:6f2b with SMTP id d2e1a72fcca58-7c58e113fc4mr38364158b3a.19.1764573280481;
        Sun, 30 Nov 2025 23:14:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGY2hTrhZgtHRkyJKpr+coY47lB4vD0k/yD/H2EvUbUcEkboGfIP2hyHolBvgND5/dm3/5U9A==
X-Received: by 2002:a05:6a00:2e0f:b0:7ab:3454:6f2b with SMTP id d2e1a72fcca58-7c58e113fc4mr38364135b3a.19.1764573280040;
        Sun, 30 Nov 2025 23:14:40 -0800 (PST)
Received: from [10.133.33.67] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d150b66c67sm12451394b3a.13.2025.11.30.23.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 23:14:39 -0800 (PST)
Message-ID: <8e2d37c3-98cd-4c32-aa8e-c0768f1fc1be@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 15:14:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: update ADSP firmware for x1e80100 platform, change the
 license
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <aeb95be6-2e42-4f0c-a34d-a6453790819b@oss.qualcomm.com>
 <a4pblzvdt6xngwfp7irvaap4bebdm2rt3dgm4dq5l3dexaw6tn@os6ymb3ytmub>
 <991d4fa5-e608-450d-94e9-cc7618f53c25@oss.qualcomm.com>
 <7v2kppjyyvbub4qylprl6rlqnfltogx7ycijvebp7gf2svy3s5@tbni27b2qpth>
Content-Language: en-US
From: Yushan Li <yushan.li@oss.qualcomm.com>
In-Reply-To: <7v2kppjyyvbub4qylprl6rlqnfltogx7ycijvebp7gf2svy3s5@tbni27b2qpth>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDA1NyBTYWx0ZWRfX1zWaFFB+vWsG
 9kBZLxhR9IU6XXFFu0on7LTFzQ5Oj4a1v3302zvZYlLcT4w/zi/RbYMvebsQuLWOwNVzz0KW2Te
 GuMsfENDMBo7mYuodxYkKOWUxETEeAvs2f/HMQMXYXgLQ3ZwQqRESVqCGe9Cgnn+UhRkq4GzlFQ
 B8TeUm+iyJMRagy3oYJFrp5mU91DuDlPsZVFJ+QpZJk7zaG8LhctLijl6CXSqrVCJHag+t5GPni
 v6roUnzr+3tOAXET1FG/rWfbx7/k97t10DDgsgBL3actta6Hr+vateL4Gp1190fPvZikysuLOej
 RSQoakvmqVlx+aGOTWye1zojNCOUm8ee2pC1+OZ+ddfrdevSKxcW1utwpTWWUMGRYbWHdjaDx+l
 BEdSOFXhUHRjSWBFo/PBwNHl/dSlxQ==
X-Proofpoint-ORIG-GUID: HfaATgVKYMrgqEuRts0XLxnDL6K2UWVk
X-Authority-Analysis: v=2.4 cv=aO79aL9m c=1 sm=1 tr=0 ts=692d4061 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=lOub_qflHBgsmIU1yV0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: HfaATgVKYMrgqEuRts0XLxnDL6K2UWVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010057


On 11/28/2025 10:14 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 28, 2025 at 05:56:22PM +0800, Yushan Li wrote:
>> On 11/28/2025 5:34 PM, Dmitry Baryshkov wrote:
>>> On Fri, Nov 28, 2025 at 05:14:39PM +0800, Yushan Li wrote:
>>>> The following changes since commit 14d4b18b066788070c382a5ff7bfdce17ee3313e:
>>>>
>>>>     Merge branch 'robot/pr-0-1764146897' into 'main' (2025-11-26 09:08:47
>>>> +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> x1e80100-adsp-1126
>>>>
>>>> for you to fetch changes up to 818809855970fbaf8055aff5a91a133ea5feed49:
>>>>
>>>>     qcom: update ADSP firmware for x1e80100 platform, change the license
>>>> (2025-11-28 15:32:30 +0800)
>>> Why are you putting x1e80100 between sa8775p and qcs8300?
>>  From my understanding, we should follow alphabetical order.
>>
>> However, since we have sa8775p and sm8750 here, and they’re separated by
>> qcs8300,
>>
>> I’m not sure which one should come next. Could you confirm if I should place
>> it after sm8750?
> Yes, please. If nobody cared about keeping the list sorted, just stick
> it to the end of the list (or bonus points for first sorting the list,
> then adding new entries).

Thanks for the clarification. I have updated the WHENCE entries to 
follow alphabetical order

and sent a new pull request email with the changes.

>>>> ----------------------------------------------------------------
>>>> Yushan Li (1):
>>>>         qcom: update ADSP firmware for x1e80100 platform, change the license
>>>>
>>>>    WHENCE                     |  14 +++++++-------
>>>>    qcom/x1e80100/adsp.mbn     | Bin 22235528 -> 22452664 bytes
>>>>    qcom/x1e80100/adsp_dtb.mbn | Bin 73528 -> 73528 bytes
>>>>    3 files changed, 7 insertions(+), 7 deletions(-)
>>>>
