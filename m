Return-Path: <SRS0=N5pP=5A=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD9ACCD1BE
	for <linux-firmware@archiver.kernel.org>; Thu, 23 Oct 2025 13:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B116C4CEFB; Thu, 23 Oct 2025 13:45:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2EE8FC4CEE7
	for <linux-firmware@kernel.org>; Thu, 23 Oct 2025 13:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2EE8FC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7UBDb011813
	for <linux-firmware@kernel.org>; Thu, 23 Oct 2025 13:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gpA4t0Tx9Nqg9KraWDRj8ETR
	jbLQkA+6OzZbdHhbozM=; b=f5H5SuhVn6fQKVY5wBCJno7CjjPoMoObJpu6VnbT
	VTuw/HTPb83GdmcD+z1HFCc6aI9L+oQrs6Zy67OiXDTy0FEB5mrulr8rklzKrt3t
	c3Txnu+YyFiwvxjENFq9ZYldPsPXVrwAvO5KCTkWsQFuURhVvZMvaXiiSp5K9Hc6
	X3JZAaupbqOQViy/ZfkCetESkAlv9EaGXlpvjX6tkqRi1PGeTxv0p9KavxwBNo/+
	sfbWdXcVybEjjuuyUS9tKTlBQgvL5em6w41jsulT7ZuQdAV+df5aPfVkQTUJxFA8
	aVB5wodPvNRZLTSh8H234P3N+U7vcCWOpfwqizb1TRLMlg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524asj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 23 Oct 2025 13:45:11 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-783cfa3c7a4so9468287b3.3
        for <linux-firmware@kernel.org>; Thu, 23 Oct 2025 06:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227109; x=1761831909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gpA4t0Tx9Nqg9KraWDRj8ETRjbLQkA+6OzZbdHhbozM=;
        b=Mf+EKAEZvnZMkCDW8gjOd0C0GywnHs4jHkTUZa/gOaIYOL74cfvogPHyEa/nKluxDb
         AF00eAfs7Uuqj/rXrYLTsMQ8ia0GKkIwIVULzohiMWrhX9zkvgEaErRuHJHPGDicxRHQ
         RCdgZFtGJvBktN/lcWY94zHCUb7QO3kHoxjKA204x3vV/V52TCtirgHJtkeum1IAOb6R
         R+SnuFjibnbRsOJ//dpeiqcujPMm5tfnjlgfUClCaJtKUivSaRJLH5MagtXRB+RqNChx
         UYvhvYuj58LKDKQ06yxVS5bzldZISsXXB5SPcKkt0NdzrdRcB/KVx3X3HtXBnNProQTw
         WN+A==
X-Forwarded-Encrypted: i=1; AJvYcCXGDj02gdGzUMiJhW+8YNIrRPK1YTXM6ZBfu/00VrWPk3CqKavPYCmB8XaaG1Q29GUcyX8/owcWyyJr/Ctp3w==@kernel.org
X-Gm-Message-State: AOJu0Yx7O025JZsta9PvFgcN6YgHpQmZCyg4aWCBPZl2QTT92dmDFxuA
	M+SVjwXIEhYuF3g2BUPhWLb/+v1Xwc5tVWntpGY+FzV7oEAf6dpVDyFI+nYXiNGHrx+w/Rm0yOs
	q798JzwGyWUSUIbSWwqekKfseeA/lQJNC9pn5oaXLrbGtQ9yeb1vgz8rXbTwvWtwn26BKc7wuhx
	xHjs8flD9jzpbnC+723CtiaW8DTJZZ1Jzgf2LDkg==
X-Gm-Gg: ASbGnctmjHbJ7tQPOvn5IWGWqR7yLGvPBM1kNM+UR5RsITh7SZB6KQI/9ULt7YvBK5o
	k52nHBPJAcYSqvvmJ/r3HC8F+aW0Lfc0SWRtB6jonHgSR24LxCzkej1fMbZ5EdJpmOePYihJCxm
	YY5GyQmVL8fzuAQ/aPo1qe7RbYUK56YX9PhYyOkE3lHUCrHrzozMZCMQd2MiJyjP0UiLqWVQ==
X-Received: by 2002:a05:690c:7086:b0:784:9e92:c664 with SMTP id 00721157ae682-7849e92ca3emr122441757b3.16.1761227109228;
        Thu, 23 Oct 2025 06:45:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlsKBz8BFpzpPylRu13d4ztAs6ML2XMao+85Qt9HQpK8cyVimN14rpj9+Mm2z3U9SypRLVu4wuwxHhyilsRBg=
X-Received: by 2002:a05:690c:7086:b0:784:9e92:c664 with SMTP id
 00721157ae682-7849e92ca3emr122441537b3.16.1761227108728; Thu, 23 Oct 2025
 06:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com> <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com> <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com> <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
 <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org> <hsj3ravxgkhnbnks7wl47qqwsef3loi44jkgahzgx2m7k4sjld@endp4nl3h6ek>
 <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
In-Reply-To: <41183580-b917-47c8-8612-426f3ae48e50@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 16:44:57 +0300
X-Gm-Features: AS18NWChk9540UMiZotHqZTODwm7O5SduturGp32FxDHIMAx4_tSI59RKYQrviQ
Message-ID: <CAO9ioeW8oSLcFAx6G1Ji0=uNrWAQYUHz7L7isFdVyF02v5aioQ@mail.gmail.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX18M5FVTyJOyu
 bEUczxuyXcr0Kj+JTOP6mIgQGADXVNOWScAzgnsZ+J5k8M1Bx3oIQ9iRLuxFddkNTOPIrl7cTtt
 uQqnjUDH3+IxITSkeP+ah5T/SI0U0TyuiMXgTXnmdjJQkDXCXLDw+I/IuGtM+E1gQZWPapXkMTT
 71lVoaFWoNsVPbmXVMR4fckTKfjosqZVim1KwveC9GGNh4TtMguya8hDaE4hF8cgYkbpSZulzmj
 LcAOYNT/HGEXYpKE2PCQDzc8Wp3XTjxzQtdAKbFJOuy1Dh73qB/0kiSU9PymPM01BEo2N6jy0fC
 +LCAfMi3ERfSpX8FNQvw8Jnmx9IA+6OZNjswWpH0qbYSQ+bcPVIJ7sV3qZX1SBPQwpOjeDEed/B
 UrrQ0T7xoXyzw9NUzQlZSvzkXXMfww==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa3167 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rC2YrvntRYF-RUPwMtgA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: 2E4EtcRT0LbkKOHqOhCcrMWVWTLdYxha
X-Proofpoint-ORIG-GUID: 2E4EtcRT0LbkKOHqOhCcrMWVWTLdYxha
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

On Thu, 23 Oct 2025 at 16:31, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/3/25 3:01 AM, Dmitry Baryshkov wrote:
> > On Thu, Oct 02, 2025 at 04:07:37PM +0100, Bryan O'Donoghue wrote:
> >> On 02/10/2025 15:59, Dmitry Baryshkov wrote:
> >>>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
> >>>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
> >>>>
> >>>> WDYT?
> >>> Well, I think that potentially complicates the driver by requiring
> >>> support for both HFIs for the same platform, it requires detection,
> >>
> >> Doesn't have to be anything more complicated than a reserved string name.
> >>
> >> BTW you're right the main reason to support this is - in effect - ending of
> >> support for gen1 firmware.
> >>
> >> But then in reality if that is the direction of travel, its in the interests
> >> of upstream and users to make the transition.
> >
> > Okay. I did a quick comparison. FP5 has gen1 firmware, is vendor-signed
> > with the T2Mobile cert and I assume it is fused. We were going to drop
> > support for sc7280 from venus in favour of supporting it in iris. What
> > would be a migration plan for FP5 users?
>
> Just like I explained, the iris driver would load in its place, it would
> retrieve the firmware binary, decide which flavor of HFI it provides and
> then decide which ops to use

Upstream-wise, the patches that I've posted for the iris driver use
gen1 firmware for SC7280 / QCM6490 / QSC6490, providing a clear
migration path from the venus driver.
If somebody wants later to implement support for loading both gen1 and
gen2 (which might be a nice idea), it needs to be implemented in the
driver.

-- 
With best wishes
Dmitry
