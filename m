Return-Path: <SRS0=63HA=ES=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45911CDB46B
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Jun 2026 09:44:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D2AB1F00A3A; Mon, 22 Jun 2026 09:44:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782121466;
	b=XnuPS1s2NiXaPeD73MyeLw0i51PcgCZB5QCHuxnmg10BE/9YM+Pd7Qp1Yosu2tVpTmU9
	 iG9oVJZwoUEhEIeWMaJFZ84lKoYM9ZwBxZkPLP3CudeWoYB/W2wVun4fU9LSwZBUF1Q6N
	 nINIIYmpU5asIA9BfSh9KJv8d5pHw7PrMJaM3Q+3ESGdpEX/qSlSTN4OnVVUGRl79ohoT
	 n4QsJiXKiPIYmGiLh0bdxirYXQ/lGMMnwzbN+zzQBVHNiAZprqK2SNpwZHxFvSB00aade
	 JdGE0cVV1S3GdY8uc4geDjrgUmj43VQtVIcvF2TMjtjTkSdf7kXwz0MRUI3ucV9l5MA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782121466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EJd4+cIk9cL+3bpMQbhNAapg4/JVwcHbeP/Xn5z5eTw=;
	b=PLfnD5y+5QMT3nAmu+tNwD5SQ6ckRZybTcd1dM8wh1wUccs2Wzv0nlVkJkGT783VxBXA
	 /WMz0cJvW1PP1wDeKZs5mgsMpp+nEF3BHcADetYMHly+/k1SW05/9vjmpILIoL4ChX4NR
	 ONvUptoK+GyW/23aucmsSZzVjSfxbvqrlNEywxaZlgLl3n4zdj2Vkd72vbvmoQgKMN4oS
	 h+4c3Mt3VWPnD1iWcWnvMIzbfGidO71/aYT0KxUAXs1QSq3nO8U6CQ1rpLwcr8jHN1H17
	 cHZwjvb8tWzn1AQ4F2JeeYzsZwb5LAttdAu5ZiIQYnztaE4P8jOpuyqeh8wOVAfc/8w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hBRloVPD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNSF0KI9;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61A991F000E9
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 09:44:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hBRloVPD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TNSF0KI9
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 61A991F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59LY42428365
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 09:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJd4+cIk9cL+3bpMQbhNAapg4/JVwcHbeP/Xn5z5eTw=; b=hBRloVPDL0ZRTsqa
	bZawvMy+RN6ELiTAs/iOkkQBsrqoatpNXIj6qZuBCUeWFmybcx3Kn6XLTzawFdHX
	BUOnP0UCI9G6QawdWBktOnvOSFpQXLE2/pV6pUUBRz1mN6o4fyfbFE9Gj6Zn0KDY
	hmC6tt4fbPPIxYnoYuQrEDWn83uCcc/4Mg0d0038MyRdiQJ5ofMFyeOdTBvWlYZV
	yuUVMSwyPowcqu2yliyfhFtS6lpBRwMZZCym0XUAbgOgePWFxiagGb0QcEvpWZfb
	IENXomrwgDxYwj2qpiYzqeVkplN+lWtAj11UyJMtTRY566KPcwHGfmliYWwQSJuv
	5jmPMQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhtsdyg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 09:44:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84256bee9a9so3010571b3a.1
        for <linux-firmware@kernel.org>; Mon, 22 Jun 2026 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782121464; x=1782726264; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EJd4+cIk9cL+3bpMQbhNAapg4/JVwcHbeP/Xn5z5eTw=;
        b=TNSF0KI9ivO4BQsWrsAlCXnwMJU2LVz9JrEe2VD38b+vLG2FvS6JGnBupP16SaQrI8
         FarxfSBIevmq1JOCcKMWvHIRfqn1XzJgmK75mUi6oylg5kDmGv2TD9vAVYvNCeJBj8zo
         IWWP2WSKDb34tDbHds7lzTL37x8i7oXgVXuMxzgHFg6Fpk4oZh0tjel7g9M/7kJOwwQ6
         GfQ/p4ol58F+pzTrxc6QvPQLbY6/u6gZAib+1EsbXqAwQutxyiegCUbj9xIml5ujXVqx
         XmUKXcD4ddNnmSq8QhGBarepq1sHcXGvk2rnaL3Llk6hYT35Ie05SzcpOq0YQTjN2y87
         zL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121464; x=1782726264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJd4+cIk9cL+3bpMQbhNAapg4/JVwcHbeP/Xn5z5eTw=;
        b=rCTdzecDCODuEn/JEFHRYOpnFKmgdHEgg5mFGlRiDy0sqI2+ZSR8wWDCa1O6MtRtXY
         iVzY8GFiK7aHcbIprRsETbMDvNjkppO448yzoCae0hd/dqOuwuST+l02RvGCl0M6+QtM
         lqXkab9P3dHfPwGGRg9DymUQksA7rvrRiWwpKo5YbnJZjuljUL9MkKD5iB9x3yULg96D
         uvxpTCH7FhnbySnDZV11Xqpvsx7LvnAocLhCYsTVZO1gRyETCMDnkWBjFA6l8DnmGbPO
         aXTmT7YH2wvR/JgpIsD8hpMPeCsibPH2vYV/lUoqlVawd6htSKnUphuhoRcitBFWy/CO
         XQCg==
X-Gm-Message-State: AOJu0YwT0FgsaSYy4ZC+K8qXUpzY+UDRaz/svZYVSDUd1JcpjltGEHDS
	9bqc3uhjHG5Bu/QjXx3APQqWnuAJGl5sK91SrQxVQH71neUdHE3v3hU5tJzHZZ6CoddIZ66Hm9i
	FMNqB8x4phPStqkGo/iK6c6lfLl0KBNguvZwcT9ZrFuhn/CpHeOSGrI/EAHnhNVHgf/dtbxE=
X-Gm-Gg: AfdE7ckp76IZqccqjhevMd5GqWh/OUi6G9Co6j/n0zsvKFzIMmH0bo/zZFIHOJeID0E
	WoLNalae8OUySjSYFUtXpE+CDrRuqCnzcF3acs+SFP+6QXHcMD9poiRiiA3ZKj//xg0FOtPC/A6
	1P5o1asRIfUszgBNq1EtcvERKuhtCcHDjktyS1CL/9S6YPk5c0hGgH+JKGUTQBaa8xUbA8BNOPz
	O9BNXcoma07W0sjIVCKWx6JK6DkpOFhybKEvsRbJweGNI/Z2fnG1XmlRwpfDZZAvttvPde7ivSM
	T+jLrsvl31K6tLDL4NmifxBx12e84QP5fGtoiAUDRWn7dVeXAMUQwNErjAnOBkool99BxWIk9CC
	Kw2DjQ6jEz5bYXexn/v7fSZIPbspVLpINplS/wBIX
X-Received: by 2002:a05:6a00:1d9d:b0:842:540d:42ea with SMTP id d2e1a72fcca58-845507e2983mr12456997b3a.19.1782121463955;
        Mon, 22 Jun 2026 02:44:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d9d:b0:842:540d:42ea with SMTP id d2e1a72fcca58-845507e2983mr12456969b3a.19.1782121463422;
        Mon, 22 Jun 2026 02:44:23 -0700 (PDT)
Received: from [10.216.36.169] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d6c25fsm7788995b3a.4.2026.06.22.02.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 02:44:22 -0700 (PDT)
Message-ID: <59937e80-7c48-4c38-8043-2bd328906b36@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:14:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: add LPAICP firmware for shikra platform
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
References: <5e55a664-5e84-404e-bb8d-e46ab946a324@oss.qualcomm.com>
 <bwzhybkl4rtrljdkkzlx3rn65cpobpemjxsqfummqhjdqb2trf@q57qshjsqimk>
Content-Language: en-US
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
In-Reply-To: <bwzhybkl4rtrljdkkzlx3rn65cpobpemjxsqfummqhjdqb2trf@q57qshjsqimk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RHrsM0dthg3E-piPahggHoG7WFloFwaJ
X-Proofpoint-ORIG-GUID: RHrsM0dthg3E-piPahggHoG7WFloFwaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5NSBTYWx0ZWRfXzACBMsq5fZRy
 nwV9y2G+/PbX36J933LnV0YGKpoAA+tVkVnyU7ZXno10qoQyEe7bK+avzdV1qVD8kW4M0WQ7vhL
 AoFfof2qstx0LfZnmcS52+EYlKbnt7ScivrFXiyp6cJlocWcjC5DYUqziitV1wI+ri3bNd7lI35
 yGkbs+N2eifSvHJA6Ri/Z937vsOOLpya4zpIVltv3G5bpff2GjV3UyAQwEO4kchxFA8MjZZDPMg
 qtor2ewB9dDLxqvkPVl9O8V4PWkslL5IVLONG7mlw2D2saPsJfUb1KyzRM5ae3/QCLNs7zzLLx9
 VisPfi51ufKy3RJSD1uHWZZ3xB2Kfucg1ttEOngBRVoupPzicf8Mlzx0orJRvW7Co7jVwfQdK2W
 JumNBUCERYEUhgDQjNLNXXt2U6DZ5SHoD/iEPTgmMc1QXFhJiladMkbnKs8+M/282GIX1BybQRD
 q++wFIk30qhM+1+dfcw==
X-Authority-Analysis: v=2.4 cv=bcRbluPB c=1 sm=1 tr=0 ts=6a3903f8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=p0WdMEafAAAA:8 a=0uVtIAK1gtMO_lgiSNoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5NSBTYWx0ZWRfXxv3Y5FKw9YTP
 8YHIjlL0CEYoyrzPVugbqQL+d5Y9FVZnXxwbxW7+p2fseJvLiev1+E/S262kxj0+RdRK58UpudQ
 wc/bdwnnlYnERHv31ZBQSenoIILAueQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220095



On 6/22/2026 2:03 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 22, 2026 at 07:17:42AM +0530, Venkata Kota wrote:
>> The following changes since commit e7eb98afc667913acc533ab910c608bee7d08f25:
>>
>>    Merge branch 'robot/pr-0-1781081510' into 'main' (2026-06-10 10:48:39
>> +0000)
> 
> This is the same and old commit.
> 
>> The source branch is 36 commits behind the target branch
> 
> And GL refuses to rebase it because of the conflicts.
> 
>>
>> are available in the Git repository at:
>>
>>    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
>> riscvfw-qli-shikra
>>
>> for you to fetch changes up to bcb6950bbf1df55f4588bc55abbd17051c4a1dc5:
>>
>>    qcom: add LPAICP firmware for shikra platform (2026-06-22 07:10:40 +0530)
> 
There is no forking done here. The process is just the same for all the 
other changes that we have pushed.
I attempted to push on gitlab directly where i ran into the following error:
remote: GitLab: You are not allowed to push code to protected branches 
on this project. This is the exact message here
To https://gitlab.com/vkasinat/linux-firmware.git
! [remote rejected]   main -> main (pre-receive hook declined)
error: failed to push some refs to 
'https://gitlab.com/vkasinat/linux-firmware.git'
