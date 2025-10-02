Return-Path: <SRS0=yklG=4L=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B1FCAC5B8
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 14:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3A00C4CEF4; Thu,  2 Oct 2025 14:59:49 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA67EC4CEFB
	for <linux-firmware@kernel.org>; Thu,  2 Oct 2025 14:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA67EC4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5929HNQt017995
	for <linux-firmware@kernel.org>; Thu, 2 Oct 2025 14:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cHkxyXpRqeNatrNIRgyeE2qQ
	pNPvXPjw3EerxSlwJeM=; b=FgPP3I/FmacdYZqFGgc4zBVPel04iaKBCf+nVEDo
	SeJwrurIbC1DtOdwY3+wCrcg52KyVhDMag4jmQNhX/UVvk8svPM3Zd0+ZbJasVLu
	UMOtTKUW+XlVIpcm5+o4TzvO2tsL1GUO7JomMoNLBoib6Q+NbxHyilVGifgVSz1d
	5EK2pSMrp19uh97IxzmToe29w1nAXrQcWmUI79/CjdmwDsbA22P0rDV8kyAHPC3R
	NTGNJnAIovqlWHnnV2Yepuwr4kSKuUuYuPjDDcMRf3sNI2JMsCR1AP5jH2vlgGhf
	lkipZbtyvOlO87U08yJokZW6+SJh2BL+tzZaIZKmChDdXg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf9m0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 14:59:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28d1747f23bso11223935ad.3
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 07:59:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759417185; x=1760021985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cHkxyXpRqeNatrNIRgyeE2qQpNPvXPjw3EerxSlwJeM=;
        b=HwPhYbHIL6SQ8Wy1SYEjwxmgC38zX8EQW0QJqOooWlkfJLESsWIzughpMgAwpCdA1O
         lfZh56mV+Ti2H08Sm2Y9uYOuyxEmwgarhMWwrupOYigHbsbWGdbE1gPwoMP9sXPERDVc
         xYBSt6uGFA/YnuKMDUuHxLDUUuQJFZ/AQIPauBsl1LfZlRa5+qL9DTBiGp5CSpwyRt5U
         Hj7bZz3cuq0Adr44TMc1CA8wMdXGHSY2K8Rde5RZ0L8TVSXMRsD6a47NFYGewVaEj5vA
         fmL8UMKOrIMQ31CApZHMLAXRe9TuBwj/qKtUaaVc25IoLX1noFLHPLsBPNRIMqW5Ln7g
         zE7g==
X-Forwarded-Encrypted: i=1; AJvYcCXIEe+svVpewEM79gfSxLmEFFNMHZxqjojZ2qvrThDcY5SlwTo0p5n0yh+tMV20jMxIlCgF43Dj8DdCYbESsg==@kernel.org
X-Gm-Message-State: AOJu0YwSvLpmgqTp3XgL6k1skB3YYdqih+522aDDDgdSfJy9jFbV1RiI
	rNHbv97YEnHrPvuIByjszSBwYAvsnpLHilMmnIGMWmqTsDrIBw/jpgRLNTwBjHdKIdIooP/jkg+
	d9Hjzm6QKn0I0NDajUldIVXG1Sein6ANb1+b/UxUS3QAAqG26T49Fr52FITdziOg2G6Pm/nJv6l
	/P/YPId9W2IrAmdotXkTX4vgoOwEYQJouSbEZyfQ==
X-Gm-Gg: ASbGnctbr1VtXHBjnR+cA+puIapQ/XX74Ip824pfo79MGeuK+ESmczK7eU23qgD7hBw
	vmElfJuwn6k924RA4df6CgjTsJ363e1t7XOtXcpiBKpGnHoApS2+kb5AStwCxZqHanzF0sGUnGv
	d8EhCiHm9CxIx6hsFHWJfPriYOZqjfUx3JEWdQ2Pw/qV2ZIy+q+0Jp69G1uA==
X-Received: by 2002:a17:903:2f08:b0:24b:270e:56cb with SMTP id d9443c01a7336-28e7f2a4503mr95015135ad.27.1759417185263;
        Thu, 02 Oct 2025 07:59:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaQLBctHvC8CtmxBNr5iX/sH6N1LhbM5SxRKU51rGDEQFwZcvga8nq+mn5DAnZ6LBVG4sLVyOeY7PZgqYhvO4=
X-Received: by 2002:a17:903:2f08:b0:24b:270e:56cb with SMTP id
 d9443c01a7336-28e7f2a4503mr95014725ad.27.1759417184737; Thu, 02 Oct 2025
 07:59:44 -0700 (PDT)
MIME-Version: 1.0
References: <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com> <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com> <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com> <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com> <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf> <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
In-Reply-To: <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 17:59:31 +0300
X-Gm-Features: AS18NWBPcMU3-ale2ZIyUoFLNdlJx04wbSN5PwB0LEhU7E4stNHylqcmWbrcP1o
Message-ID: <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: qGfeGG8OG0a9NyEXy31X0Be6HnsRIgAz
X-Proofpoint-GUID: qGfeGG8OG0a9NyEXy31X0Be6HnsRIgAz
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68de9362 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=EUspDBNiAAAA:8 a=iE2qV1ZtOnQiC2fKDmEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX1H4xYRPdZTux
 s8YNUOZysxD57pwCCtHU52HmIaq/qcJNDkL4bvXRLpsonNc1gxdGdFScdk8K1E7t0Sk6uJX6kao
 /zJEF2YrtuEvZfoAsPE5qBslKARYujBNt2HZhERM/fGW1OJBOa6K0d14AxJqCIZQZ5pKqZ9IexE
 VFkS8Sxmw9EjpsI+YkatqjBAlwoknMtIuqux+v/xqZ4U23IXtKOzIIWY+BsMX3AVOWI6CU7BjTS
 I6eMtbbqZMMWCqvGBZEOv3QCtMYCeJAfV05r+WDqmKhqC73MfVMSBjNxzSFzAsWN80xWDagiu3T
 3Qr0zmP2wFKZTYu1x4FTKk8inQSs4DLXlDOcRoKboXNrGDj8sbou/0ozf6+7kH+0Q9h0evimCrG
 FYX34SAm3cCXRnq5+HNM/Fz8+Oom+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175

On Thu, 2 Oct 2025 at 15:38, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/24/25 6:16 PM, Dmitry Baryshkov wrote:
> > On Wed, Sep 24, 2025 at 01:55:22PM +0100, Bryan O'Donoghue wrote:
> >> On 24/09/2025 11:43, Dikshita Agarwal wrote:
> >>>>> I understand your concern. To clarify, we are not removing support for the
> >>>>> existing Gen1 firmware, so backward compatibility remains intact.
> >>>>>
> >>>>> We are simply adding support for Gen2 firmware for this architecture. As a
> >>>>> result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
> >>>>> Gen2 firmware (via Qualcomm's video driver [1]).
> >>
> >> I agree with Dmitry here.
> >>
> >> Its not possible to disjunct upstream HFI6xx @ the firmware level between
> >> Venus and Iris because the DTS would have to point to a particular firmware
> >> depending on which driver you wanted to run, which would make the DT
> >> dependent on the driver, which is not allowed.
> >
> > The only possible way to make that work would be to:
> > - make iris driver detect the firmware interface and then use either
> >   gen1 or gen2 interface
> > - make that into the upstream kernel
> > - drop venus support for sc7280
>
> We talked a little internally and the benefit of moving 7280 to gen2
> is basically that it would get more fw updates.. which is utmost
> desirable from our POV.

This is just an internal decision of a team to stop supporting gen1
for sc7280. I really don't see a reason for that.
Which firmware was provided to the existing customers, for example for
FP5? Particle Tachyon? Nothing Phone (1)?

> My understanding and recollections are that:
>
> * Because Iris already supports 8250, it's only a short walk away from
>   supporting 7280-gen1. We could then also add support for 7280-gen2 and
>   detect the supported firmware interface at runtime.

Can we? I don't think that the driver supports detecting the firmware
interface just by looking at the file.

>
> * If the Venus driver would be loaded instead, it would also be taught
>   to reject gen2 firwmare if that is supplied (before eventually getting
>   sunset, hopefully..).
>
> * The current gen1 firmware could be kept in linux-firmware parallel to
>   vpu_whatever_gen2.mbn.

If I remember correcrtly, venus driver is going to stop supporting
those devices at some point.

>
> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
>   that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
>
> WDYT?

Well, I think that potentially complicates the driver by requiring
support for both HFIs for the same platform, it requires detection,

>
> Konrad
>
> >
> >>
> >>>>> Additionally, as part of our plan to transition all Venus-supported targets
> >>>>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
> >>>>> to maintain backward compatibility.
> >>>> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
> >>>> interchangeable for the hardware they both support, until the venus
> >>>> driver drops support for V6 hardware. At that point it's expected that
> >>>> there will be no V6 support in Venus driver.
> >>>>
> >>>> You can not simply upgrade to Gen2 firmware as if nothing happened.
> >>>> Consider a device node on SC7280 / QCS6490 with the firmware-name
> >>>> pointing to OEM-signed firmware. Both Venus and Iris drivers would
> >>>> happily consume the device node and try to work with it. One will work,
> >>>> another one will fail. This is definitely not what we have agreed upon,
> >>>> when you started adding Iris driver.
> >>> @Vikash, could you please chime in?
> >>
> >> It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a new
> >> SoC that doesn't appear upstream yet but, that's not the case with
> >> 7280/6490.

I'd like to point out. It's not about upstream vs downstream. It's
about whether we can support the users of the shipped devices or not.



-- 
With best wishes
Dmitry
