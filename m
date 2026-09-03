Return-Path: <SRS0=wIDi=G3=oss.qualcomm.com=shuai.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912A8C624D6
	for <linux-firmware@archiver.kernel.org>; Thu,  3 Sep 2026 02:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5ABA91F00A3A; Thu,  3 Sep 2026 02:51:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788403887;
	b=M/27rSjQhNgCN+SPtTPkc0UF9l0XlagReDZKOZFB9mmjJmFwXF3G95ko1UaC43W7j1xX
	 KRc4uGKMn2bTggaJA+/26+pQuMOmZjQLiMrMkzmwJi29gC9EXtbSmvwoSB2ANvXmdIyD9
	 PzK725oev8+LxlfZWDkVwjlt4c92EstSalSRB2Pc6ytq430numq87sI1nYdV1zwnftE0E
	 1SJHUlagVy81VAo+dQYLrRVy4iYu3AYWO9MjeFKi5WdvnL5kYS1FXp5qCOILSnecJjKT8
	 Lb7ENaWntmiHXzobh5kqtb/DCp+5dqaTd6Fc8GTCyQC0uMMOuBtlot7zTdO97/KHvSQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788403887;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:List-Id:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1Z3JF66esf9mPrAet997GQNRfyDErMPQeZtT5hmSjew=;
	b=RPrHCvFnHFNMTf3quPB6s1vKQL/pnBKIBoOLfjjPygUJTCDlg8Cj5xL8dMgIWnuQi5mr
	 gaCP2qOhj+esvgKpWA38FiQyf72UCaB7zzI32QJbXdKoET+nIv+OUu3TnjiEa9QSm/1cI
	 cpN42JJGUWohfgIwg/E9TRWnvPY/BSlR+OXhenUEyaCQbVZEAKMN6TfMCtTojWqNPDQii
	 RLbGJCmH5TYG4/mZhkDcSepoEeQbR/qaHFZpEJwYleI+oaC3y83WcbZLv3+8IL9MtAqpX
	 lHud5mg3/YECmccQcn0KAbPfsAZlo+RdjOQOh/+GKupyBENIZVnU+kSoGU2z99xQSgA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RGSWi2dM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KHqWYp+E;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 965031F000E9
	for <linux-firmware@kernel.org>; Thu,  3 Sep 2026 02:51:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RGSWi2dM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KHqWYp+E
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 965031F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHefT2348180
	for <linux-firmware@kernel.org>; Thu, 3 Sep 2026 02:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Z3JF66esf9mPrAet997GQNRfyDErMPQeZtT5hmSjew=; b=RGSWi2dM7VneLiMx
	UXCr2vHrQwIO0ttodLRHn2J1gvMXTBIqTww/a+qjCN8m7IzBirHKIEqjpCxKePLa
	ZQi9iHWIH7+lAr1ujKASuTBhUUsFt6TrihRQ2JggMVZePUFy7LrERDF2ymtIV9Zz
	Y5c3S7TsaF9IJWOtPtTPqfwrumEeCckmDjWbouErjDdz1ib2VLBZDVLnzclxSl6H
	rCZOX3FmqOMDiONlhI0wtiaWvijYP13frtlgSq01fSi4bPrLNEYdhadI0VrxBHcZ
	sFaKoN5xX6/x03mLaUuwxhZK9DF4vA/VbjbTN5taOqrynBNGwkj7hTKtNKvzgkTb
	3AmVMw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4u3v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 02:51:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so1619725b3a.2
        for <linux-firmware@kernel.org>; Wed, 02 Sep 2026 19:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788403884; x=1789008684; darn=kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Z3JF66esf9mPrAet997GQNRfyDErMPQeZtT5hmSjew=;
        b=KHqWYp+EFbwM0ECh/nia7SdfimIiTU0uv9qM720u87BJ7shosHIBsGAPzvyODOufGn
         QiBGw46UpAhyKzMN0d2e1KOmaq/dg3u7dwtTZvYLYgGA5NUypGH6Vqp1O00GG0AgjF2z
         SW1sVvv3MajnVkGAUN/oNsyrBi28RWudSXLPVN3ZzMXABnDwjEqybRwC/KyERPmLblHO
         72h247mT61Qlgo40aJ9ts5HoWL9qMfQpQ8CAitVYSfxa9EG97KxmtD5/ahiZFbqoZb6+
         jrdg/zxE14gmMKEqm8xRzG6FEolWhdxxEGTb6utyuaYMFxqoszGmfUjvbN+QJXyclY17
         +TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788403884; x=1789008684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Z3JF66esf9mPrAet997GQNRfyDErMPQeZtT5hmSjew=;
        b=oj6bbFlSTFBC97jbAEiwAxeWp0i8X4uaSeFFXtpTydzh49bh0XgnMCrtopJIlNk9yH
         KY1w5LdpRl69+36zqIUkZtex35tdAONoX2o5rrNheFkZwpj60vjd8DH50pTmsHqTb7LG
         zISUSu2x2uFb2U7JoGKGeJHjRyZiYyCMy8Y6HObl0W1VpCnBEph6/nPlEy6c82RfPyNu
         FGFPparQoJPjyrbThXPciuHdVANKcUSIMQjv0UXoXhcSxv+S+6WdYCOftchVY1DAtZuV
         9DJkvBcg6scXSBJCZTzh/b0lvazenYvolhgj2utUZzsbFrDqMdycEHeEQFweG0fO7C0p
         olog==
X-Gm-Message-State: AFuF++m0ejh817qJTSlhkte8WN7UPsW0pN5kcy/14+U0QjQmCddZiMrN
	mGeMS0HAtO+/64k/LUksPQajTEUfi7GqnckTfLTXPdQcpcO6utRbRtF0U3umVg8ILVcZ3710sPp
	4W5w5pWsWRt2rDInlwuDMBqxUjI+qjSuVZDufIHxdLmj0Thf4LQY0y+zETtA3Nqo=
X-Gm-Gg: AYBFou28fOIk0eoLE8sOUK90FbVkJNjLEmkUJTmr2IOEpN+8M/NxmU142bu98uglp/K
	MwWb8sXnpTIZFhgcWiVjh0GcjsHec+FMkF1rN9GmkbZxv2lOLNRNNmOHqYS96XiyTRp9R82Yv9Z
	iASDhFV3vK1DpPRBIwhIwwcaJP+PGqkcLtaxDVlK2k16l0ta+sdkM0SvPYcnINbFt710Ufh50Bk
	YFoKdpZ75Zs+lSUJrRv9SF2YSwAcCHfwJFUoDvN0zeCCP3bDyCFXQKZxNnDmJTRKmjJgtb8kI2M
	3OwLItaLAr6kv9lLLwe1kz5XEDgyQJIiZheYKDDolriOzl/P4sxD/RagzaY/JE5CX7ZxOKXrvSl
	HOiG0D9GK9IMlEVYyrQwZsxmMTsE=
X-Received: by 2002:a05:6a00:f04:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-85ed3e73dbemr13901512b3a.14.1788403884113;
        Wed, 02 Sep 2026 19:51:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:f04:b0:848:2ab3:ddeb with SMTP id d2e1a72fcca58-85ed3e73dbemr13901436b3a.14.1788403883539;
        Wed, 02 Sep 2026 19:51:23 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2bd6de7sm2099543b3a.23.2026.09.02.19.51.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 19:51:23 -0700 (PDT)
Message-ID: <115bff7f-86d1-4798-8aac-674864713821@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:51:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c request-pull
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, cheng.jiang@oss.qualcomm.com,
        wei.deng@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
References: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
 <4z7ylgqvfizcdzyakkaymp4l6hr5qx2g3tddaqvzfqujecbxye@qu37vrgudb3e>
 <0b6bcc31-1428-4652-9855-4a52ae1c77ca@oss.qualcomm.com>
 <os2dizgipn7xbnbgycs3h6fyrcbsk4ybutndexwl5jiu5cd4ax@2xvwaxte5ys6>
 <4054cd15-d1a3-4157-ac11-f4d248890865@oss.qualcomm.com>
 <pckqcqzhpax562yzhinf2fbjqgy2qcqaaoyhw6xgitrrksv5ag@pqv2s3jdvpue>
 <819b432c-6f63-4ce4-9c80-61453fa8456d@oss.qualcomm.com>
 <3lo6dh6q726emqikhm4ynikwnrefva3ucsrhrmuyjcn4wnhlhn@7cdvnwbuyvji>
Content-Language: en-US
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
In-Reply-To: <3lo6dh6q726emqikhm4ynikwnrefva3ucsrhrmuyjcn4wnhlhn@7cdvnwbuyvji>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfX2LmDBLr2vmqc
 VcxtfQa/3Nm9YSuUSFGC6AFg/Ao5+BWIZNNoka7+SGXvGn3VER5nPIONTsXqCzj0fxQs+8p/M24
 Pf4mW/48IOn0o9+Yj3Zu5GVIxjzgywkbxvu0ObC3yWhDGlbE16h3C7ak51pS21pbZRs+B8ZBWSw
 /kzyEMvdT8su7tdkarBqXizGJq22dqkQCqB5LFLX2SdenwwbEPEzNzCWjHLjJ/6tPSGDs89IFsT
 Phj0pg1xsYiY9pRNiZQS1eRzgdXeVmH7fFR+0H90XrxPpXDy5ayLmAbI3e9BCu1+FCUjt9Is/J2
 L5DCNYXXSwDIl9GzM4Yq0J+eKfM/kgmBnh3GhfC0q7wN/0ZDMxQJ8guEhsrkX/XUFVMKMtG6lfK
 qPFQxKoP1iqi6+uH00J2mK9HxH3zrxb/gLIDvBXOXD8Xprce0ZlGmS05xTL+PwBG5rFwOhTvrXV
 tmPltL2GOlHYZEWL9WQ==
X-Proofpoint-ORIG-GUID: 1HqR8iPO3XHR3PT8hkPnjK5TzJa6sNhd
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a98e0ad cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=CIwvohErVITE-RgkcT0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 1HqR8iPO3XHR3PT8hkPnjK5TzJa6sNhd
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNCBTYWx0ZWRfX6L1/jNOzLhZv
 xY4sYX17gpm15IYljtRw0gaD/0rxgdl9SGHL9KQpFfC/qQos67mSFAZJYtb34NDPnYdxWmdDwo0
 ObtZnURd2aIDVXnPcjJ2QUvBmmmg8Q0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030024

Hi Dmitry

On 9/2/2026 4:36 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 02, 2026 at 10:40:54AM +0800, Shuai Zhang wrote:
>> On 9/2/2026 10:26 AM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 02, 2026 at 10:04:09AM +0800, Shuai Zhang wrote:
>>>> Hi Dmitry
>>>>
>>>> On 9/1/2026 7:05 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Sep 01, 2026 at 11:07:20AM +0800, Shuai Zhang wrote:
>>>>>> Hi Dmitry
>>>>>>
>>>>>> On 8/31/2026 8:29 PM, Dmitry Baryshkov wrote:
>>>>>>> Please test your PRs before submitting:
>>>>>>>
>>>>>>> E: qca/hpnv21g.30c not listed in WHENCE
>>>>>> Thanks for the reminder. I'veupdatedthePRaccordingly.
>>>>>>
>>>>>>
>>>>>> are available in the Git repository at:
>>>>>>
>>>>>>      https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2
>>>>>>
>>>>>> for you to fetch changes up to 2245d3d1eb0593145573a41fa941e4e056031cab:
>>>>>>
>>>>>>      QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-09-01 10:51:03
>>>>>> +0800)
>>>>> So, previously it was a link, you are replacing it with the file. Why?
>>>> I checked the WHENCE entry and thought the symlink was incorrect, so I
>>>> replaced the Link entry with a File entry.
>>>>
>>>> hpnv21g.30c is a renamed version of hpnv21g.b111, which was what I
>>>> originally submitted.
>>>>
>>>> Please let me know if the preferred approach is to keep the symlink and only
>>>> add the hpnv21g.30c file.
>>> If the file is already present, why are you submitting a new copy of it?
>>
>> This file does not actually exist. It is only referenced in WHENCE. The
>> relevant commit is shown below:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=3dcf6778d29c72f91aa0ac0ef8843a4aa6e11c1b
> And this commit means that during firmware installation the script will
> create a symbolic link pointing from one file to another. This is a
> proper way to handle duplicate files instead of creating a complete
> duplicate:
>
> $ md5sum qca/hpnv21g.b111 qca/hpnv21g.30c
> 3f5c3585d7a0bf1f076ac95b7f69b5a3  qca/hpnv21g.b111
> 3f5c3585d7a0bf1f076ac95b7f69b5a3  qca/hpnv21g.30c

Could you please clarify the rationale behind introducing the symlink?

I couldn't find any related discussion or explanation in the project 
history.



In addition, if I need to make changes to the 30c file in the future and 
those changes

  are not applicable to b111, what would be the recommended way to 
handle that situation?



Thanks，

Shuai

