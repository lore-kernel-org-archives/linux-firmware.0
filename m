Return-Path: <SRS0=63HA=ES=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B935CD98F2
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2026 11:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1553C1F00A3A; Mon, 22 Jun 2026 11:04:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782126240;
	b=FL5N4VyCMb98EKDfPT/uZ1RDh/LJ7lQ2u+ommx70bwkZPgcvZHYrh6YBtVTU4MdaH8Eo
	 sjOUqwf89XQsDbIEdyqm/5+/Xh8uYPHTEvS000/CKbZFhXA97K+0A40jEiVv9u6IwL5Mh
	 K90qXJc5L64pIz8Wkxowmzf0FAFEjMJD478X5pjfPDEuXE46IxkBpB+Ty06F84dpGwpQT
	 /xbQAlzovbnWp1w8sW8yIb+aKBntq/xBC6gTFJU4EjXZrEMCAc4ythFcDF7/mre8yMlEm
	 s1KhosEupMXTk/GzJAS2RigYD8OOU1i7KnEXGMJlvgiuvwaq9cbeuC/vONwAIGhq2gg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782126240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GaYcGJbPg8ig6vvrFei/en/Np2UN/qxvUhNrkxtPrIc=;
	b=Llvgc/vT3367TBxMtek8LkBJrFnJ4eUrcyyq60vE9Mdhvz2KEVGeccUScfMAF/xeluM9
	 1vtJtvKCH27yNryGKBIONfoUn3YSnQ47NZhTWmMmTMesUfqJzlnkPiTi6pMWqHd9CqrX5
	 zhkaZKB2Ux2C+ptd6dCzyzxgf5brLlwdzR6ARs0rovPMewFgyT0K0CLzcpuMawA8nIdhI
	 t6NRLTAWGkx9eOWQSL/byoaA3T666mYfnsNWvyTacNMBvyBBGl9RXr3CgC9NLdEEGvRiD
	 XCwOWvkf1FjN51fBX1vXgYycDzLbacHlrkE5wmTzaYg7ZatC6yFb1gTP6nt8uBHgcJw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ekkQsp7u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Mp/EvoAC";
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6CD861F000E9
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 11:03:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ekkQsp7u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mp/EvoAC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6CD861F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAngZX397391
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 11:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaYcGJbPg8ig6vvrFei/en/Np2UN/qxvUhNrkxtPrIc=; b=ekkQsp7u0W/ZwFn/
	6GGtxq7nWkaJM2VMWWtUwTs4N+OzuWuyPXPmfp4C4GJgxo4bie4TDpIbLShCoH9r
	FX4z4TmdRMF1G5TLOWk/gS9aAAlwVajxILDYLGt40SCyw5WfjNvyMq20Ir+4sZ/3
	ouPq6tSV3I+Qbp0MnmAEtDmm8MoULJtF7DZ+aKQhgSeO6Gmtf6DzVtbTkxvx7P3L
	Qz+lHlEwEzUxV/FzB4FTy4mq6/Op2tTI1WwNkeN0vKdV2uGXjbwgpTmWtn8VWrU0
	N9Xnd1O7NjeT8li7A/iuU+lXz+tl6BxJkURBujTqVxZ+liFgxU9nvldIX704GzyN
	BqjoyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm1k61ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 11:03:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so4811171a91.2
        for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782126238; x=1782731038; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GaYcGJbPg8ig6vvrFei/en/Np2UN/qxvUhNrkxtPrIc=;
        b=Mp/EvoACLf9TJiUcMrFnCSm6za2J5hm0JfKMXWzuWavRltU0kCz0kefZKwsyZlRnkX
         8vs67cQ6LadOLwhnRYChzUNijph4LrqvB0HreUXD8+L4/X3BivffKFLkR0Xowk8Jp6ig
         R15JpPr5wbYmxaQQuI2y19VpHYn4+i+UBN3CDioz5qj8Mr1WpZXFhsN8NruC+8bTEf6J
         Qhy43hHgokPDVo4e4czrpjtvcUq+PeORNFCWoIDmHF6N4BsC88HWvANUwZyh0syQ5ukF
         phBxKmmiSmBEULEdTIah4+1GS3s069m6Bp0wi1qg6FddYEDRoPsvFxEr+zDI44/HDDqA
         S+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782126238; x=1782731038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaYcGJbPg8ig6vvrFei/en/Np2UN/qxvUhNrkxtPrIc=;
        b=ZDOiOP3nTHemXlGzUB5DfCDDim5E/UnWnMuXCmF4FB+ij0dRF3BwU3FRXTkD66Zw2q
         l1jluBldUpEhg2nYAAK09kbVk2sDVneS4bn5cBJrk+Gsy4ts9Ne2wJy5O4NsGl589eU/
         AZwtNTg+E+/nh5jHqV3SqpqxWYEoSC45U5g231SQewAN6UDdXxH9FB22O57C3228MdjT
         oZv4bxbONPMKIfjJaDjAewL+wF65fWs9HPXFc/ZLK+jp+Hv8LKqN1kr0/hJcl//QGPKN
         7TxFilX6zfL28LjS8XsSrOEDNIbFJorXCCD3fY99Tn+Qjgew6WR9qtCU1pJixKtVTKXJ
         3rMQ==
X-Gm-Message-State: AOJu0Yy2L7iVzswyhi0fRsXLV+ZMx76BFb/i1EUliid/htL8lIaE9lBi
	0lR0Obu7cqJjLSPlSmVMU0zaFd/m97/es5gQmgE//AjpPTy8jr71TFARzf5eM3eJekuzv741jk2
	Cdb8oU3/9vH1/kWRzaNAabdTEIDMvh/xtx/9BUHYSqFXBP2lwspux+g02Y1VCBww=
X-Gm-Gg: AfdE7cl6mtwAsM7pYldvg3H1lw65FpbCX+QDhaRl5txASd8VxgQThDWzwwflcte3u0s
	JQQ8lrvH94sN4s9AuCH9SwmmzGL+PIprdwq3dmodqcHKaDVu8aBe/Y4jvhqjj4xq+I98KrAFd63
	KeN25CaXIqNE9gB99c1PcH6V3EVo4eoLLfkalnOLLr16K/XiwSzQQj/d2hO4XDf7uPv0wEOoIYZ
	0G4jASFgq4+/RCTFmMKytR5FHF8q+AJePjfPfaCC0jq8o/0yjOJWhxYZsXauJwNxk+0Tx6b4kOv
	j7qydI7UU7KOjkRxeUM6+I8DF9IFFo0IU88+EJMwLNbd9M5HPn0gna7baMkPP7gSRrQqxzxsWS2
	joIENp/TEgEs5K9r0lPOLLbAk3eW+wsGmY8sM521h
X-Received: by 2002:a17:90b:1dd2:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-37d4e86d51cmr11190399a91.24.1782126237801;
        Mon, 22 Jun 2026 04:03:57 -0700 (PDT)
X-Received: by 2002:a17:90b:1dd2:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-37d4e86d51cmr11190308a91.24.1782126236734;
        Mon, 22 Jun 2026 04:03:56 -0700 (PDT)
Received: from [10.216.36.169] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d135e2031sm9812423a91.0.2026.06.22.04.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:03:56 -0700 (PDT)
Message-ID: <94b93be6-9281-4e6f-ac21-a32fca2110b0@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 16:33:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add LPAICP firmware for shikra platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <5e55a664-5e84-404e-bb8d-e46ab946a324@oss.qualcomm.com>
 <bwzhybkl4rtrljdkkzlx3rn65cpobpemjxsqfummqhjdqb2trf@q57qshjsqimk>
 <59937e80-7c48-4c38-8043-2bd328906b36@oss.qualcomm.com>
 <czrjz3taxceyxohxse2dzalvgg6uubtk7l7juj3mt3cgbpqvtf@vzlgbd4pf6mc>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <czrjz3taxceyxohxse2dzalvgg6uubtk7l7juj3mt3cgbpqvtf@vzlgbd4pf6mc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4FITG3vLCkZkbwbyHEgk8VYFjToFj-Lo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDEwOCBTYWx0ZWRfX9EfeJOUU4pUS
 B3otUjd64Xf/TnJ8u2mqqs3dGAbCtFj6ihoiykaDC2yiiue9PUlArcjw/ReLfa5laSY7cCgEYC/
 PAftwP7Pzhd8ro3AQJ4GdraLdJd4P0I=
X-Authority-Analysis: v=2.4 cv=T6S8ifKQ c=1 sm=1 tr=0 ts=6a39169e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8
 a=3G-VCXUDZWco9KAv6tUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDEwOCBTYWx0ZWRfX3OGE1nl8Iokc
 UbQsEcZyFYwjQNQK9HpHVdbvYPH/JGTd15H6uo3bbjYy3dc60DtNA0OW2nwYa+EllCLl27umbwA
 mHEqkm4EEGb6XgvBWNNdueOuu249Ljo8cvynI1Rs8bwGsClJmA5gjbvJUZgn6Mh9D/1Jo+it+bO
 97AAp4VXZtlNOUzvZ3zs8/LNHBWW6PDUW1v9KnOY5cMoq85r8fbrbmgHIM9S8xlzunM+KsGaj5Y
 dyRcZ64O55Ftp5iCreP/JSkEwb8wklLjueAvCiG1gUD5oo10DAwDbb9+krN/miT8m14Ar1v+M7Q
 XWBsjbth5JikZIUnjBC0SMC/0J+mmSsiHlqtEWQd2ZyRz2kfv3AuY2BwTIfPBV71cZ6MHbbzsWu
 7b9SEhsg/z8jxSh59LU3A3y6QKf/v3uvMgK3VYTGA/FI3OIyvF7QIqhpJtGVbC3LEfOA23hSzcW
 ezZkbsV6yFVxhGORWqQ==
X-Proofpoint-ORIG-GUID: 4FITG3vLCkZkbwbyHEgk8VYFjToFj-Lo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220108



On 6/22/2026 4:26 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 22, 2026 at 03:14:19PM +0530, Venkata Kota wrote:
>>
>>
>> On 6/22/2026 2:03 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jun 22, 2026 at 07:17:42AM +0530, Venkata Kota wrote:
>>>> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
>>>>
>>>>     Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
>>>> +0000)
>>>
>>> This is the same and old commit.
>>>
>>>> The source branch is 36 commits behind the target branch
>>>
>>> And GL refuses to rebase it because of the conflicts.
>>>
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>>>> riscvfw-qli-shikra
>>>>
>>>> for you to fetch changes up to bcb6950bbf1df55f4588bc55abbd17051c4a1dc5:
>>>>
>>>>     qcom: add LPAICP firmware for shikra platform (2026-06-22 07:10:40 +0530)
>>>
>> There is no forking done here. The process is just the same for all the
>> other changes that we have pushed.
> 
> I didn't write anything about forking. I asked to _rebase_ on the repo's
> tip.
I understand that. Reference to forking does not make sense.

However, I was mentioning that we always run the following commands.

--git clone 
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

--cd linux-firmware/

--git config user.email "venkata.kota@oss.qualcomm.com"

--git checkout -b dsp-fw-00qcs83      (Create new branch with dsp-fw-*)

--git remote add clo-fw 
https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git <which 
should push to the tip>
--git push clo-fw dsp-fw-00qcs83 (Branch)

--make changes, commit and push clo-fw
> 
>> I attempted to push on gitlab directly where i ran into the following error:
>> remote: GitLab: You are not allowed to push code to protected branches on
>> this project. This is the exact message here
>> To https://gitlab.com/vkasinat/linux-firmware.git
>> ! [remote rejected]   main -> main (pre-receive hook declined)
> 
> Which basically asks you, why you are pushing to the main branch
The idea was to try to push on the fork and raise a PR using gitlab -- 
similar to the way we run on github
> 
>> error: failed to push some refs to
>> 'https://gitlab.com/vkasinat/linux-firmware.git'
> 

